const express = require('express');
const router = express.Router();
const Post = require('../models/post');

router.post('/new', (req, res) => {
    Post.create(req.body).then((doc) => {
        console.log(doc.id);
        res.send("Post Created: " + doc.id);
    }).catch((err) => {
        console.log(err);
        res.status(400).send("Error creating post");
    })
});

router.get('/', (req, res) => {
    Post.find().then((doc) => {
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.post('/id', (req, res) => {
    Post.findById(req.body.id, (err, doc) => {
        if (err) return res.status(400).send("Can't find: " + req.body.id);
        res.send(doc);
    })
})

module.exports = router;