# Standard streams

## Wikipedia
In computer programming, standard streams are preconnected input and output communication channels[1] between a computer program and its environment when it begins execution. 

The three I/O connections are called standard input (stdin), standard output (stdout) and standard error (stderr). 

Originally I/O happened via a physically connected system console (input via keyboard, output via monitor), but standard streams abstract this.

https://en.wikipedia.org/wiki/Standard_streams in Wikipedia 

## Dennis M. Ritchie 
A stream is a full-duplex connection between a user’s process and a device or pseudo-device.
It consists of several linearly connected processing modules, and is analogous to a Shell pipeline, except that data flows in both directions.

A Stream Input-Output System by Dennis M. Ritchie

## Javier, the one and only
So what are stdin, stdout and stderr??

STDIN Used when you type something
STDOUT Used when you print something
STDERR Used when a program crashes

# Using streams in the shell

**< for STDIN**

    $ cat < README.md

**> STDOUT**

Redirecting STDOUT to STDERR

    $ echo hello 1>&2

**2> STDERR**

Redirecting the STDERR to STDOUT

    $ echo 2>&1

## What do the numbers mean?

These are the numbers for the file descriptors:

> 0 STDIN
>
> 1 STDOUT
>
> 2 STDERR

When you open a file in your program, it might get any number except those three.

# The Task
Write a program in any of our current future languages (Go, Javascript, Python).

Let's assume it's called `myprog` and is in the current directory.

Make it do these things:

1. Read a number from stdin (as one line)!

    $ echo 1 | ./myprog

2. Print the number on stdout!

    $ echo "1" | ./myprog
    1

3. Print the number **plus 1** on stderr!

    $ echo "1" | ./myprog
    1   # That's stdout
    2   # That's stderr


## How to test:

Run the test.sh with a tiny test suite.

    es-ulysses/unix-stdin-stdout-stderr$ ./test.sh ./myprog

Use the reference.sh to see a working version and the expected output:

    es-ulysses/unix-stdin-stdout-stderr$ ./test.sh ./solution.sh 
    I. Piping numbers thru stdin, expecting them on stdout as is
     • [1] -> [1] => ✔ 
     • [2] -> [2] => ✔ 
     • [3] -> [3] => ✔ 
     • [4] -> [4] => ✔ 
     • [5] -> [5] => ✔ 
    II. Piping numbers thru stdin, expecting them on stderr increased by 1
     • [1] -> [2] => ✔ 
     • [2] -> [3] => ✔ 
     • [3] -> [4] => ✔ 
     • [4] -> [5] => ✔ 
     • [5] -> [6] => ✔ 


*********
Follow up questions:

1. In Go, besides the formatting capabilities, what is the difference between print and fmt.print?
1. What does echo "ABC" 1> /dev/null do?
1. What does echo "ABC" 2> /dev/null do?
1. And echo "ABC" 2>&1 /dev/null ?
1. And echo "ABC" &> /tmp/m

