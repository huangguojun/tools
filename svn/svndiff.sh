#!/bin/sh

DIFF="vimdiff"
LEFT=${6}
RIGHT=${7}

$DIFF -f $LEFT $RIGHT
