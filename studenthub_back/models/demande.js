const mongoose = require('mongoose');

const demandeSchema = new mongoose.Schema({
    demandeur: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Students',
        required: true
    },
    date_retour: {
        type: Date,
        required: true
    },
    materiel: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Materiel',
        required: true
    },
    date_demande: {
        type: Date,
        required: true,
        default: Date.now
    },
    status: {
        type: String,
        enum: ['available', 'pending', 'accepted', 'rejected'],
        default: 'available'
    },
    demande_ref: {
        type: String,
        default: function() {
            const randomLetters = Array.from({length: 5}, () => 
                String.fromCharCode(65 + Math.floor(Math.random() * 26))
            ).join('');
            return `dmd_${randomLetters}`;
        }
    }
}, { timestamps: true });

// Index pour améliorer les performances des requêtes
demandeSchema.index({ demandeur: 1, date_demande: -1 });
demandeSchema.index({ materiel: 1 });

module.exports = mongoose.model('Demande', demandeSchema);
