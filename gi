#!/bin/sh
# by tlehman
# 
# → awk < ~/.bash_history '{print $1}' | sort | uniq -c | sort -n | tail -20
#   971 make
#  1040 ack
#  1203 pbpaste
#  1507 curl
#  1564 bundle
#  1569 cat
#  1574 sql
#  1586 brew
#  1675 g
#  1958 find
#  1969 rake
#  2225 rails
#  2498 exit
#  2522 gi     (this is a common enough mistake that I made this script)
#  2627 cd
#  2691 bin/rspec
#  2694 vim
#  4208 clear
#  5701 ls
# 35813 git

if   [[ $1 =~ 'ts' ]]; then
  git s
elif [[ $1 =~ 'tb' ]]; then
  git b 
elif [[ $1 =~ 'tdiff' ]]; then
  git diff
elif [[ $1 =~ tlo?g ]]; then
  git diff
fi

