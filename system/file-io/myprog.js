#!/usr/bin/node
var fs = require('fs');
fs.readFile(__dirname + '/text-drop-each-2nd-character.txt', function(err, data){
	if(err) throw err;
	data = data.toString();
	var output = '';
	var counter = 1;
	for(var i=0;i<data.length; i++){
		if(counter === 2) {
			counter = 1;
			continue;
		}
		output +=data[i];
		counter++;   
	}
	console.log(output);
});

fs.readFile(__dirname + '/reverse-me.fdp', function(err, data){
	if(err) throw err;
	fs.writeFile('reversed.pdf', new Buffer(data.toString("binary").split('').reverse().join(''), "binary"));
});
