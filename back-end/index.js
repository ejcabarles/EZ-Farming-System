'use strict';

const config = require(__dirname + '/config/config');
const express = require('express');
const bodyParser = require('body-parser');
const farming_sys = require(__dirname + '/farming_sys')
const path = require('path');

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


//app.use(express.static(__dirname + '/'));
//app.use(express.static(__dirname + '/../frontend'));

// put functions here




app.get('/viewPlotInformation', function(req, res) {
	farming_sys.viewPlotInformation(req, res);
});


app.listen(config.PORT, function (){
	console.log ('Server listening on Port: ' + config.PORT)
});



app.get('/bower', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/bower_components/Materialize/dist/css/materialize.min.css'));
});
app.get('/localCSS', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/style.css'));
});
app.get('/jquery', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/jquery-3.1.1.js'));
});
app.get('/angular', function(req, res) {
    res.sendFile(path.join(__dirname + '/../angular.min.js'));
});


app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/index.html'));
});


app.get('/app', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/app.js'));
});

app.get('/headerController', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/controllers/headerController.js'));
});
app.get('/plotController', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/controllers/plotController.js'));
});


app.get('/headerDirective', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/directives/headerDirective.js'));
});
app.get('/plotDirective', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/directives/plotDirective.js'));
});



app.get('/header', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/views/header.html'));
});
app.get('/plots', function(req, res) {
    res.sendFile(path.join(__dirname + '/../front-end/views/plots.html'));
});