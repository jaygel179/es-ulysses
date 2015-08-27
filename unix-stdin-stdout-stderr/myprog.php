#!/usr/bin/php
<?php 
$line = trim(fgets(STDIN));
fwrite(STDOUT, $line);
fwrite(STDERR, $line + 1);
?>