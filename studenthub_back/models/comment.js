const mongoose = require('mongoose');

const commentSchema = new mongoose.Schema({
    post: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Post',
        required: true
    },
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
    likes: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Students'
    }],
    createdAt: {
        type: Date,
        default: Date.now
    }
}, { timestamps: true });

module.exports = mongoose.model('Comment', commentSchema);
