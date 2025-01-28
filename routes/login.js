var connection = require('../connect');
var express = require('express');
var session = require('express-session');
var router = express.Router();

router.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

  // Authentication route
  router.post('/auth', function(request, response) {
    var username = request.body.username;
    var password = request.body.password;
    if (username && password) {
      connection.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
        if (results.length > 0) {
          request.session.loggedin = true;
          request.session.username = username;
                          if (results[0].types === 'admin') {
                            const { DateTime } = require('luxon');

                            // กำหนดโซนเวลาเป็น Asia/Bangkok (GMT+7)
                            const thaiDateTime = DateTime.now().setZone('Asia/Bangkok');

                            // แปลงเป็นสตริงในรูปแบบที่ต้องการ
                            const thaiFormattedDateTime = thaiDateTime.toFormat('yyyy-MM-dd HH:mm:ss');

                            console.log(thaiFormattedDateTime);

                            const logadminData = {
                              logUsername: username,
                              logPassword: password,
                              logTime: thaiFormattedDateTime
                            };
                            
                            const query = 'INSERT INTO logadmin SET ?';
                            
                            connection.query(query, logadminData, (error, results, fields) => {
                              if (error) {
                                console.error('Error inserting data:', error);
                              } else {
                                console.log('Data inserted successfully!');
                              }
                            });
            response.redirect('/admin_auth/adminForm'); // เปลี่ยนเส้นทางไปยังหน้า products สำหรับ admin
          } else if (results[0].types === 'customer') {
            response.redirect('/customers_auth/login/productsForm'); // เปลี่ยนเส้นทางไปยังหน้า home สำหรับ customer
          }
        } else {
          response.send('Incorrect Username and/or Password!');
        }
        response.end();
      });
    } else {
      response.send('Please enter Username and Password!');
      response.end();
    }
  });
  


module.exports = router;