'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';
console.log(process.env);

// App
const app = express();
app.get('/', (req, res) => {
  res.send(process.env);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
