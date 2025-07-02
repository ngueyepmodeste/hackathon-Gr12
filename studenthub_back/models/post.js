const mongoose = require('mongoose');

const postSchema = new mongoose.Schema({
    author: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Students',
        required: true
    },
    content: {
        type: String,
        required: true,
        maxlength: 1000
    },
    media: {
        images: [String], // URLs des images
        videos: [String]  // URLs des vidéos
    },
    likes: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Students'
    }],
    comments: [{
        author: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Students',
            required: true
        },
        content: {
            type: String,
            required: true,
            maxlength: 500
        },
        createdAt: {
            type: Date,
            default: Date.now
        }
    }],
    tags: [String], // hashtags
    visibility: {
        type: String,
        enum: ['public', 'friends', 'private'],
        default: 'public'
    },
    isEdited: {
        type: Boolean,
        default: false
    },
    editedAt: Date
}, { timestamps: true });

// Index pour améliorer les performances des requêtes
postSchema.index({ author: 1, createdAt: -1 });
postSchema.index({ tags: 1 });

module.exports = mongoose.model('Post', postSchema);
