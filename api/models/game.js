const mongoose = require('mongoose');

const Game = mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    rating : {
        type: Number,
        required: true
    },
    mainImg: {
        type: String,
        required: true
    },
    imgs : [String],
    desc : {
        type: String,
        required: true
    }
});

module.exports = mongoose.model('Game', Game);