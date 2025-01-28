var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/loginForm', function(req, res, next) {
  res.render('loginForm', { title: 'Express' });
});

router.get('/insertForm', function(req, res, next) {
  res.render('insertForm', { title: 'Express' });
});

router.get('/searchingForm', function(req, res, next) {
  res.render('searchingForm', { title: 'Express' });
});

router.get('/serviceForm', function(req, res, next) {
  res.render('serviceForm', { title: 'Express' });
});

router.get('/contactForm', function(req, res, next) {
  res.render('contactForm', { title: 'Express' });
});

module.exports = router;
