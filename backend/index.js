'use strict';

const config = require(__dirname + '/config/config');
const express = require('express');
const bodyParser = require('body-parser');
const farming_sys = require(__dirname + '/farming_sys')

var loggedIn = false;

let app = express();

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');

    next();
}

app.use(allowCrossDomain);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.use(express.static(__dirname + '/'));
app.use(express.static(__dirname + '/../frontend'));

// put functions here

app.get('/viewPlotInformation', function(req, res) {
	farming_sys.viewPlotInformation(req, res);
});

app.post('/addPlotInformation', function(req, res) {
	farming_sys.addPlotInformation(req, res);
});


app.listen(config.PORT, function (){
	console.log ('Server listening on Port: ' + config.PORT)
});