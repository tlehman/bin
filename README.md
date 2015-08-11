# my assorted utility scripts

### addrcoords
Take an address, get the GPS Coordinates from Google

```
$ addrcoords '123 Main St, Springfield, ST 01023'
{
  "lat": 64.121415,
  "lng": -101.125193
}
```

### anagrams
Generate all anagrams of a string:

```
$ anagrams doe
doe
deo
ode
oed
edo
eod
```

Really interesting uses of this script would be to combine it with a dictionary of words and only select those anagrams that are words.

For example, Mac OS X has a dictionary `/usr/share/dict/words`

So we could filter out only those anagrams that are in the dictionary like so:

```
$ anagrams doe | for perm in $(cat -); do grep -i "^$perm$" /usr/share/dict/words; done
doe
ode
Edo
```

### argraph
ActiveRecord graph: makes a GraphViz digraph that shows all the `belongs_to` associations in a rails app

##### Usage:

Suppose you have the [discourse](https://github.com/discourse/discourse) rails app checked out, and you want to find out how some of it's models are interrelated:

```
$ cd discourse
$ argraph Post Topic Category PostReply User UserAction UserHistory QuotedPost View UserAvatar
digraph {
 Post -> User
 Post -> Topic
 Topic -> Category
 Topic -> User
 Category -> Topic
 Category -> User
 PostReply -> Post
 UserAction -> User
 QuotedPost -> Post
 QuotedPost -> QuotedPost
 View -> User
 UserAvatar -> User
}
$ !! | dot -Tpng > discourse.png
```

The output of `argraph` is a digraph in the [DOT language](http://www.graphviz.org/doc/info/lang.html), which can be rendered as an image using [GraphViz](http://www.graphviz.org/).

*The nodes are ActiveRecord models, and the edges represent the 'belongs to' relation.*

The above graph renders as:
![discourse model graph](https://i.imgur.com/YQOyHUn.png)

### battery
Returns percentage of battery left (Mac OS X)

### days_since
Days since last merge commit.

```
$ days_since
480 days since Tobi Lehman merged without rebasing
```

### db
Enables quick SQL queries against Rails apps using MySQL or PostgreSQL. Note: I used DECIMAL since `CAST(version AS DECIMAL)` works in both MySQL and PostgreSQL.

### dbtt
Shows current point in rails migration 'timeline'

### desk
Log state changes for adjustible-height desks

TODO: Implement height control, so that changing the state of the desk and logging are both automated.

### dumbplot
Plots two-dimensional dataset in GNUplot (thanks to @jeroenjanssens)

### edit
Opens a file in a running Emacs process ;(server-start)

### exifyear
Extract year from DateTimeOriginal in EXIF metadata

Example:

```
$ exifyear img_204.jpg
2011
```

### fastroutes
`rake routes` can take a long time to run, I'm measuring about 7 seconds, that's enough time to want to leave and slack off. Unacceptable.

fastroutes caches output of config/routes.rb for rails applications. To avoid going stale, the md5 hash of config/routes.rb is in the filename under tmp/.

This means that you only ever run `rake routes` once after each time routes.rb has changed, then each subsequent time, you pull from "tmp/cached_routes_$(md5 config/routes.rb).txt"

### fmtnum
Formats a number using commas:

```
$ fmtnum 1000000000000000000
1,000,000,000,000,000,000
```

### gi
After [analyzing my bash history](http://tobilehman.com/blog/2013/06/18/analyzing-bash-history-and-fixing-typos/) I found it would be worthwhile to write this script, so that commonly mis-typed commands like `gi ts` and `gi tb` work as intented.

### git-bq
Git branch quick

### git-grepblame
Git grep and git blame, together at last.

### git-log-display
Step through git diffs, one commit at a time. Hit 'q' to step to previous commit, or 'Ctrl-C' to exit.

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

### headers
Gets only the headers of the HTTP response

```
$ headers tblh.mn/42
HTTP/1.1 301 Moved Permanently
Date: Thu, 23 Apr 2015 22:09:38 GMT
Server: Apache
Location: https://tobilehman.com/tblhmn/42
Content-Length: 297
Content-Type: text/html; charset=iso-8859-1
```

### ipaddrs
Find external IP address and log with timestamp.

### Jenkins
Show status of all Jenkins jobs at command line

### tfind
(Mac OS X 10.9+ only) Find files under ~ that have a given tag.

### tld
ccTLD lookup:

```
$ tld ke
.ke Kenya
```

### todo
Extract TODO messages from list of files on stdin

```
$ git ls-files | todo
  TODO messages from list of files on stdin
  todo messages
  todo .*)$/i && print "\t$1\n"' < $line
  TODO implement method to derive stop ID from text alias
  
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
To prepare, run `clang -framework Foundation maclock.m -o maclock`

Locks a machine running Mac OS X (works with Knock)

### paths
Print out directories in `PATH`, one per line

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

### screens
Show ids of all detached screen sessions:

Examples:

```
$ screen -ls
There are screens on:
  46784.ttys006.manifold  (Detached)
  47401.ttys006.manifold  (Detached)
2 Sockets in /var/folders/3_/j4m3c1x500773nrb6xxh8ggh0000gn/T/.screen.
$ screens
4678
4740
```

### shuffle
Shuffle lines from standard in randomly:

```
tlehman@hausdorff:~/bin(master+)% ls | shuffle | head
dbtt*
wrap*
websocketd*
desk*
edit*
ipaddrs*
anagrams*
vs*
decommonize*
count_lines_by_lang*
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
