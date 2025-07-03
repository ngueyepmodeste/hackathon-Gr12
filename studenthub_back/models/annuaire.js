const mongoose = require('mongoose');

const annuaireSchema = new mongoose.Schema({
    nom: {
        type: String,
        required: true,
        trim: true
    },
    mat: {
        type: String,
        required: true,
        trim: true
    },
    phone: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        required: true,
        trim: true,
        lowercase: true
    }
}, { timestamps: true });

// Index pour améliorer les performances des requêtes
annuaireSchema.index({ nom_prof: 1 });
annuaireSchema.index({ mat: 1 });
annuaireSchema.index({ email: 1 });

module.exports = mongoose.model('Annuaire', annuaireSchema);
