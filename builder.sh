#!/bin/sh
echo "builder - src: $src, out: $out"
$cp $src $out
$chmod +x $out
