# my assorted utility scripts

### battery
Returns percentage of battery left (Mac OS X)

### db
Enables quick SQL queries against Rails apps using MySQL

### dbtt
Shows current point in rails migration 'timeline'

### desk
Log state changes for adjustible-height desks

TODO: Implement height control, so that changing the state of the desk and logging are both automated.

### dumbplot
Plots two-dimensional dataset in GNUplot (thanks to @jeroenjanssens)

### edit
Opens a file in a running Emacs process ;(server-start)

### fmtnum
Formats a number using commas:

```
$ fmtnum 1000000000000000000
1,000,000,000,000,000,000
```

### gi
After [analyzing my bash history](http://tobilehman.com/blog/2013/06/18/analyzing-bash-history-and-fixing-typos/) I found it would be worthwhile to write this script, so that commonly mis-typed commands like `gi ts` and `gi tb` work as intented.

### git-grepblame
Git grep and git blame, together at last.

### git-bq
Git branch quick


### hc
HTTP Status Code lookup:

```
$ hc 20
200 OK
201 Created
202 Accepted
203 Non-Authoritative Information (since HTTP/1.1)
204 No Content
205 Reset Content
206 Partial Content
207 Multi-Status (WebDAV; RFC 4918)
208 Already Reported (WebDAV; RFC 5842)
420 Enhance Your Calm (Twitter)

$ hc 418
418 I'm a teapot (RFC 2324)
```

### tld
ccTLD lookup:

```
$ tld ke
.ke Kenya
```

### wrap
Wraps each line in stdin with single quotes.

### hexchr
Convert ASCII/UTF-8 hexstrings to readble format:

```
$ hexchr 68656c6c6f20776f726c640a
hello world
```

### histogram
Quick histogram display, command line only (thanks to @bitly)


### kg
Generate a complete graph in GraphViz format:

```
$ kg 5
graph k5 {
  2 -- 1
  3 -- 1
  3 -- 2
  4 -- 1
  4 -- 2
  4 -- 3
  5 -- 1
  5 -- 2
  5 -- 3
  5 -- 4
}
```

![K5](http://i.imgur.com/oc8JNeA.png)

### maclock
Locks a machine running Mac OS X

### pwdiffs
Pairwise diffs of a stream of integers:

```
$ seq 10 | pwdiffs
1
1
1
1
1
1
1
1
1
```

### snake_case
Convert string of any form into snake_case_form

Examples:

```
$ echo 'Economic Possibilities for
 our Grandchildren' | snake_case
economic_possibilities_for_our_grandchildren

$ echo ObjectOrientedProgrammingForSickCats | snake_case
object_oriented_programming_for_sick_cats
```

### transpose
Transpose a file delimited by whitespace

### vs
Open in MacVim after fuzzy search with selecta
