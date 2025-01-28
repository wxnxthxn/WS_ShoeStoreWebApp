const mysql = require('mysql');
// สร้างตัวแปร connection จาก object mysql ให้ทำการเชื่อมต่อ
const connection = mysql.createConnection({
host: 'localhost', 
user:'root',
database:'shoesstore',
password:''
});

module.exports = connection;
