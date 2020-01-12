const express = require('express');
const router = express.Router();
const Game = require('../models/game');

router.get('/', (req, res) => {
    Game.find().then((doc) => {
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    })
});

router.post('/id', (req, res) => {
    Game.findById(req.body.id, function (err, doc) {
        if (err) return res.status(400).send("Can't find: " + req.body.id);
        res.send(doc);
    });
});

module.exports = router;