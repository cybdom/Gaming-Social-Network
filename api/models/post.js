const mongoose = require('mongoose');

const Post = mongoose.Schema({
    title: String,
    content: String,
    media: [{
        mediatype: Number,
        content: String
    }],
    userId: String,
    gameId: String,
    likes: Number,
    comments: [{content: String, user: String}],
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Post', Post);