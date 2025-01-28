var express = require('express');
var router = express.Router();
var mysql = require('../connect');

//ดึงข้อมูลในตารางมาแสดงในหน้า authurize ของ admin  
  router.get('/admin_auth/adminForm', function(req, res, next) {
    var sql = 'SELECT * FROM products';
    mysql.query(sql,(err, result)=>{
        if(err){
          res.send(err);
        }else{
          res.render('adminForm', { items:result });
        }
      })
    });
        
// ดึงข้อมูลในตารางขึ้นมาแสดงในหน้า authurize ของ customer  
router.get('/customer_auth/productsForm', function(req, res, next) {
    var sql = 'SELECT * FROM products';
    mysql.query(sql,(err, result)=>{
        if(err){
          res.send(err);
        }else{
          res.render('productsForm', { items:result });
        }
      })
    });

        
// แก้ไขตารางสินค้า (update table)
 router.get('/edit/:ProductID',(req, res) => {
    var sql = 'SELECT * FROM products WHERE ProductID=?';
    mysql.query(sql,req.params.ProductID, (err, result) => {
        if(err){
            res.send(err);
        }else{
            res.render('updateForm',{
                data:result[0]
            });
        }
    })
  })
  router.post('/edit/:ProductID',(req,response)=>{
    var sql = 'UPDATE products SET? WHERE ProductID =?';
    var params=[req.body,req.params.ProductID];
    mysql.query(sql,params,(err,result)=>{
        if(err){
            response.send(err);
        }else{
            response.redirect('/admin_auth/adminForm');
        }
        response.end();
    })
  })

  // เพิ่มข้อมูลในตาราง 
router.post('/insert',(req, res)=>{
    var sql = 'INSERT INTO products SET?';
    var data = req.body;
    mysql.query(sql,data,(err,result)=>{
      if(err){
        res.send(err);
    } else{
      res.redirect('/admin_auth/adminForm');
    }
    })
  });
  
// ค้นหาข้อมูลรายการสินค้า
router.get('/searching',(req,res)=>{
  console.log(req);
  var sname=req.query.q;
  var sql = "SELECT * FROM products WHERE ProductName LIKE '%"+sname+"%'";
  mysql.query(sql,(err, result)=>{
     if(err){
      res.send(err);
    }else{
      res.render('searchingForm', { items:result });
    }
  })
});


// ลบข้อมูลสินค้าในตาราง
router.get('/delete/:ProductID',(req, response) => {
  var sql = 'DELETE FROM products WHERE ProductID = ?';
  var id=req.params.ProductID;
  console.log(id);

  mysql.query(sql, id, (err, result) => {
      if(err) {
       response.send(err);
          console.log('OK');
      }else{
       console.log('OK');
          response.redirect('/admin_auth/adminForm');
      }
      response.end();
  });
});

module.exports = router;