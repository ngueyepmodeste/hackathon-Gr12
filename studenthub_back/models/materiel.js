const mongoose = require('mongoose');

const materielSchema = new mongoose.Schema({
    nom_materiel: {
        type: String,
        required: true,
        maxlength: 100
    },
    stock: {
        type: Number,
        required: true,
        min: 0
    }
}, { timestamps: true });

module.exports = mongoose.model('Materiel', materielSchema);
