// pull in desired CSS/SASS files
require('./styles/main.scss');
var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js');
require('../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js');

var Elm = require('../elm/Main');
Elm.Main.embed( document.getElementById('main'));
