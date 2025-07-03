const mongoose = require('mongoose');

const bibiothequeSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        trim: true
    },
    files: [{
        url: { type: String, required: true },
        type: { type: String, enum: ['image', 'pdf', 'video'], required: true },
        name: { type: String }, // nom du fichier
    }],
    author: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Students',
        required: false
    }
}, { timestamps: true });

module.exports = mongoose.model('Bibiotheque', bibiothequeSchema);
