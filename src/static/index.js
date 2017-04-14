require('./styles/main.scss');

var faVars = require('!raw!../../node_modules/font-awesome/scss/_variables.scss');

var Elm = require('../elm/Main');
var app = Elm.Main.embed(document.getElementById('main'), faVars);

app.ports.copyToClipboard.subscribe(function (selector) {
	var element = document.querySelector(selector);
	if (!element) {
		return;
	}
	var range = document.createRange();
	range.selectNode(element);
	window.getSelection().addRange(range);
	document.execCommand('copy');
});