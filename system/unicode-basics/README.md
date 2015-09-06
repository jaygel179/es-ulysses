# Unicode Basics: Convert Encodings

Learn to read and write text files in different Unicode encodings. Learn how to get the code points of a given, encoded character.

## The Challenge

Write a program that reads a text file, transforms the text and writes it into another file.

The program shall …

* accept four parameters: input-file input-encoding output-file output-encoding
* only consider the encodings `utf-8` and `utf-16` and `utf-32`.
* read the input file with the input encoding.
* transform the text from the input file by increasing each code point by 1.
* write the transformed text to the output file with the output encoding.

Example calls:

    ./myprog beautiful.txt utf-8 squidward.txt utf-16
    ./myprog dora.txt utf-16 explorer.txt utf-16
    ./myprog hit.txt utf-16 me.txt utf-8

If the input file contains the text `A` (code point 0x41), then the output file should contain the text `B` (code point 0x42).


## Test

    ./test.sh ./my-prog
