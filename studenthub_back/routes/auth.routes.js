const express = require('express');
const router = express.Router();
const Students = require('../models/students');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');

dotenv.config();

// ✅ Route création de compte (le hash est fait automatiquement dans le modèle)
router.post('/create-account', async (req, res) => {
  try {
    const student = new Students(req.body);
    await student.save();

    res.status(201).json({ message: 'Étudiant créé avec succès 🟢', student });
  } catch (err) {
    if (err.code === 11000 && err.keyPattern && err.keyPattern.email) {
      return res.status(400).json({ message: "Cette adresse email existe déjà 🔴: " + req.body.email });
    }
    res.status(400).json({ message: err.message });
  }
});

// ✅ Route connexion (login)
router.post('/log-in', async (req, res) => {
  try {
    const { email, password } = req.body;

    const student = await Students.findOne({ email });
    if (!student) {
      return res.status(401).json({ message: 'Adresse email incorrecte 🔴' });
    }

    // 🔐 Comparaison avec le hash en base
    const isMatch = await bcrypt.compare(password, student.password);
    if (!isMatch) {
      return res.status(401).json({ message: 'Mot de passe incorrect 🔴' });
    }

    // ✅ Génération du token JWT
    const token = jwt.sign(
      { _id: student._id, username: student.username },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.status(200).json({ message: 'Connexion réussie 🟢', token, student });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
