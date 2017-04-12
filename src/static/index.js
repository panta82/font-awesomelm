// pull in desired CSS/SASS files
require('./styles/main.scss');

var faVars = require('!sass-to-js-var!../../node_modules/font-awesome/scss/_variables.scss');
var faNames = Object.keys(faVars);

var Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('main'), faNames);
