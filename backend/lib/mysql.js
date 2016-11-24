const mysql 	= require('mysql');
const config	= require(__dirname + '/../config/config');

module.exports = mysql.createConnection(config.DB_CRED);