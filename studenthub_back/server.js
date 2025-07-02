const express = require('express');
const app = express();
const PORT = 3000;
const connectDB = require('./core/db');
const Students = require('./models/students');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');

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
                        { expiresIn: '1h' }
                    );

                    res.status(200).json({ message: 'Connexion réussie 🟢', token, student });
                })
                .catch(err => res.status(500).json({ message: err.message }));
        })
        .catch(err => res.status(500).json({ message: err.message }));
});

// lancer le serveur
app.listen(PORT, () => {
    console.log(`Serveur démarré sur http://localhost:${PORT}`);
});
