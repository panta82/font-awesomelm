require('./styles/main.scss');

var faVars = require('!sass-to-js-var!../../node_modules/font-awesome/scss/_variables.scss');
var faNames = Object.keys(faVars);

var Elm = require('../elm/Main');
var app = Elm.Main.embed(document.getElementById('main'), faNames);

app.ports.copyToClipboard.subscribe(function (iconName) {
	var element = document.querySelector('.icon-' + iconName);
	var range = document.createRange();
	range.selectNode(element);
	window.getSelection().addRange(range);
	document.execCommand('copy');
});
