#!/bin/bash

printf "a\n">temp.txt
cat phase1.txt >> temp.txt
awk -vc=1 'NR%9==2{++c}{print $0 > "phase2-"0(c-1)}' temp.txt
rm temp.txt
rm phase2-00
mv phase2-010 phase2-10
mv phase2-011 phase2-11
mv phase2-012 phase2-12

