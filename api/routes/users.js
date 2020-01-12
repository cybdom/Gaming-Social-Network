const express = require('express');
const router = express.Router();
const User = require('../models/user');

router.post('/new', async (req, res) => {
    const newUser = await User.create(req.body);
    res.send(newUser.id);
});

router.get('/', async (req, res) => {
    console.log(req);
    User.find().then((doc) => {
        res.send(doc);
        console.log(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.post('/id', (req, res) => {
    User.findById(req.body.id, (err, doc) => {
        if (err) return res.status(400).send("error");
        res.send(doc);
        console.log(doc);
    });
});
// test
router.post('/ids', (req, res) => {
    console.log(req);
    User.findById(req.body.id, (err, doc) => {
        if (err) return res.status(400).send("Can't find: " + req.body.id);

        console.log(doc); res.send(doc);
    })
})
module.exports = router;