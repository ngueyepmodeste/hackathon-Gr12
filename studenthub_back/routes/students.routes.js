const express = require('express');
const router = express.Router();
const Students = require('../models/students');
const auth = require('../middleware/auth'); // importe le middleware

// Get student profile — protégé
router.get('/:id', auth, async (req, res) => {
  try {
    const student = await Students.findById(req.params.id).select('-password');
    if (!student) return res.status(404).json({ message: 'Étudiant introuvable 🔴' });
    res.json(student);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Update student profile — protégé
router.put('/:id', auth, async (req, res) => {
  try {
    // Tu peux aussi vérifier que req.user._id === req.params.id pour plus de sécurité
    if (req.user._id !== req.params.id) {
      return res.status(403).json({ message: "Action non autorisée 🔴" });
    }

    const student = await Students.findByIdAndUpdate(req.params.id, req.body, { new: true }).select('-password');
    if (!student) return res.status(404).json({ message: 'Étudiant introuvable 🔴' });
    res.json({ message: 'Profil mis à jour avec succès 🟢', student });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
