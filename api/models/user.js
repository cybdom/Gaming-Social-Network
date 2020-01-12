const mongoose = require('mongoose');

const User = mongoose.Schema({
    profilePicture: { type: String, required: true },
    fullname: { type: String, required: true, },
    username: { type: String, required: true, },
    verified: { type: Boolean, required: true, },
    followers_count: { type: Number, required: true, },
    following_count: { type: Number, required: true, },
    posts_count: { type: Number, required: true, },
    posts: [{
        mediatype: Number,
        content: String
    }],
});

module.exports = mongoose.model('User', User);