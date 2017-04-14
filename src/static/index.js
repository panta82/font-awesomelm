require('./styles/main.scss');

var faVars = require('!raw!../../node_modules/font-awesome/scss/_variables.scss');

var Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('main'), faVars);
