const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const postsRoutes= require('./routes/posts');
const gamesRoutes= require('./routes/games');
const usersRoutes= require('./routes/users');

require('dotenv').config();
app.use(bodyParser.json());

// Routes
app.use('/posts', postsRoutes);
app.use('/games', gamesRoutes);
app.use('/users', usersRoutes);

// Connecting to database
mongoose.connect(
    process.env.DB_CONNECT, { useNewUrlParser: true, useUnifiedTopology: true }, () => {
        console.log("Database connected.")
    });

// Starting server
app.listen(80, () => {
    console.log("Server Started");
});