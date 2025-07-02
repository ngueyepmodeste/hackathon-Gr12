const express = require('express');
const app = express();
const PORT = 3000;
const connectDB = require('./core/db');
const Students = require('./models/students');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
const Post = require('./models/post');
const Comment = require('./models/comment');
const Materiel = require('./models/materiel');
const Demande = require('./models/demande');

dotenv.config();

connectDB();

// Middleware pour parser le JSON
app.use(express.json());


// route pour la page d'accueil
app.get('/', (req, res) => {
    res.send('service backend');
});

// route pour la création d'un compte student
app.post('/api/students/create-account', (req, res) => {
    const student = new Students(req.body);
    student.save()
        .then(student => res.status(201).json({ message: 'Etudiant créé avec succès 🟢', student }))
        .catch(err => {
            if (err.code === 11000 && err.keyPattern && err.keyPattern.email) {
                return res.status(400).json({ message: "Cette adresse email existe déjà 🔴:" + req.body.email });
            }
            res.status(400).json({ message: err.message });
        });
});

// route pour la connexion student
app.post('/api/students/log-in', (req, res) => {
    const { email, password } = req.body;
    Students.findOne({ email })
        .then(student => {
            if (!student) {
                return res.status(401).json({ message: 'Adresse email incorrecte 🔴' });
            }

            bcrypt.compare(password, student.password)
                .then(isMatch => {
                    if (!isMatch) {
                        return res.status(401).json({ message: 'Mot de passe incorrect 🔴' });
                    }
                    //  JWT token
                    const token = jwt.sign(
                        { _id: student._id, username: student.username },
                        process.env.JWT_SECRET,
                        { expiresIn: '7d' }
                    );

                    res.status(200).json({ message: 'Connexion réussie 🟢', token, student });
                })
                .catch(err => res.status(500).json({ message: err.message }));
        })
        .catch(err => res.status(500).json({ message: err.message }));
});

// route pour le profil student
app.get('/api/student/profile', async (req, res) => {
    const token = req.headers.authorization.split(' ')[1];
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const student = await Students.findById(decoded._id);
    res.status(200).json({ message: 'Profil récupéré avec succès 🟢', student });
});

// route pour créer un post
app.post('/api/posts/create', async (req, res) => {
    try {
        const { author, content, media, tags, visibility } = req.body;
        if (!author || !content) {
            return res.status(400).json({ message: 'Auteur et contenu requis.' });
        }
        const post = new Post({
            author,
            content,
            media: media || {},
            tags: tags || [],
            visibility: visibility || 'public'
        });
        await post.save();
        res.status(201).json({ message: 'Post créé avec succès 🟢', post });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

// route pour récupérer tous les posts
app.get('/api/posts/all', async (req, res) => {
    try {
        const posts = await Post.find()
            .populate('author', 'f_name l_name username avatar_url school major')
            .sort({ createdAt: -1 });

        // le nombre de commentaires pour chaque post
        const postsWithCommentCount = await Promise.all(posts.map(async (post) => {
            const commentCount = await Comment.countDocuments({ post: post._id });
            const postObject = post.toObject();
            return {
                ...postObject,
                commentCount
            };
        }));

        res.status(200).json({
            message: 'Posts récupérés avec succès 🟢',
            posts: postsWithCommentCount
        });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

//route pour ajouter un commentaire
app.post('/api/posts/comment', async (req, res) => {
    const { postId, author, content } = req.body;
    const comment = new Comment({ post: postId, author, content });
    await comment.save();
    res.status(201).json({ message: 'Commentaire ajouté avec succès 🟢', comment });
});

// route des commentaires par post
app.get('/api/posts/comments/:postId', async (req, res) => {
    const comments = await Comment.find({ post: req.params.postId })
        .populate('author', 'f_name l_name username avatar_url school major')
        .sort({ createdAt: -1 });
    res.status(200).json({ message: 'Commentaires récupérés avec succès 🟢', comments });
});

// route pour la gestion des materiels  
app.post('/api/admin/add-materiel', async (req, res) => {
    const { nom_materiel, stock } = req.body;
    const materiel = new Materiel({ nom_materiel, stock });
    await materiel.save();
    res.status(201).json({ message: 'Materiel ajouté avec succès 🟢', materiel });
});

app.get('/api/admin/materiels/all', async (req, res) => {
    const materiel = await Materiel.find();
    res.status(200).json({ message: 'Materiels récupérés avec succès 🟢', materiel });
});

// route pour la gestion des demandes
app.post('/api/demandes/create', async (req, res) => {
    const { demandeur, date_demande, date_retour, materiel } = req.body;
    const demande = new Demande({
        demandeur,
        date_demande,
        date_retour,
        materiel,
        status: 'pending'
    });
    await demande.save();
    res.status(201).json({ message: 'Demande ajoutée avec succès 🟢', demande });
});

app.get('/api/demandes/all', async (req, res) => {
    const demandes = await Demande.find()
        .populate('demandeur', 'f_name l_name username avatar_url school major')
        .populate('materiel', 'nom_materiel stock');
    res.status(200).json({ message: 'Demandes récupérées avec succès 🟢', demandes });
});


// route pour accepter ou refuser une demande
app.put('/api/admin/demandes/:demandeId/status', async (req, res) => {
    const { status } = req.body;
    const demande = await Demande.findByIdAndUpdate(req.params.demandeId, { status }, { new: true });

    // Si la demande est acceptée, décrémente le stock du matériel
    if (status === 'accepted' && demande && demande.materiel) {
        await Materiel.findByIdAndUpdate(
            demande.materiel,
            { $inc: { stock: -1 } }
        );
    }

    res.status(200).json({ message: 'Statut de la demande modifié avec succès ��', demande });
});


// lancer le serveur
app.listen(PORT, () => {
    console.log(`Serveur démarré sur http://localhost:${PORT}`);
});
