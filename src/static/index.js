// pull in desired CSS/SASS files
require('./styles/main.scss');

var fa = require('../../node_modules/font-awesome/scss/_variables.scss');
console.log(fa);

var Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('main'));
