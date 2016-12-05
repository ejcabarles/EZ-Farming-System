var mysql = require("mysql");
var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : 'useruser',
	  database : 'farming_sys'
	});

connection.connect(function(err){
	if(!err) {
	    console.log("Database is connected ... nn");    
	} else {
	    console.log("Error connecting database ... nn");    
	}
});

// PUT FUNCTIONS HERE

exports.viewPlotInformation = function(req, res) {
	connection.query('SELECT * FROM plot', function(err, row) {
		if(err) res.send('Error in viewing plot information!');
		else res.send(row)
	});
};

exports.addPlotInformation = function(req, res) {
	var post = {
		plotid : req.body.plotid,
		zone : req.body.zone,
		row : req.body.row,
		col : req.body.col
	};

	connection.query('INSERT INTO plot SET ?', post, function(err, row) {
		if(err) res.send('Error in adding plot information!');
		else res.send("Successfully added plot information")
	});
};