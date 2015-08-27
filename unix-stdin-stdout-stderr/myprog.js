#!/usr/bin/node
process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function(data){
	console.log(data);
	console.error(parseInt(data, 10) + 1);
});