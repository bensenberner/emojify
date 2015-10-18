#!/bin/sh

for f in $(ls | head -10); do
    open $f
done
