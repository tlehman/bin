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

### upcase, downcase and capitalize

```
$ echo hello | upcase
HELLO

$ echo HELLO | downcase
hello

$ echo hello | capitalize
Hello

```

### circleci
Show formatted recent builds from CircleCI

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

### devlog
Log to [my devlog](https://github.com/tlehman/etc/blob/master/spacemacs.el#L367-L404) using the running instance of emacs:

```
$ devlog
Some notes <Enter>
nil
    7903 /Users/tobilehman/sync/devlog.org
```
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

### imsg
iMessage from the command line (macOS only)

Usage:

```
usage: imsg foo.bar@icloud.com 'Are you going to be at the blurnsball game tonight?'
  (or) imsg 5550129933 'Can you grab me some LED bulbs from Ace?'
```

### imgcat
Display image at the command line using iTerm2 2.9 or higher

![imgcat](https://www.iterm2.com/images/inline_image_sparky_demo.png)


### isup
Check if the HTTP status of a site changes

example:
```
$ isup https://github.com &
$ # keep doing work, and get a desktop notification when the HTTP status changes
```

### ipaddrs
Find external IP address and log with timestamp.

### Jenkins
Show status of all Jenkins jobs at command line

### jfoo
Quickly generate a java program with a main function

```
jfoo AtomicIntegerExample
# generates ~/tmp/AtomicIntegerExample.java
```

### now
Get the current time in the correct format

```
$ now 
2018-01-04 11:23:14
$ now -z
2018-01-04 11:23:22 (-0800)
```

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

### orb
Change color of Particle Photon Sphere (orb)

```
orb yellow
```

Changes the orb color to yellow

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

### strike

Strikethrough text using unicode

```
$ strike hello
h̶e̶l̶l̶o̶
$ echo foo bar | strike
f̶o̶o̶ ̶b̶a̶r̶
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

### tz
Find timezone and then format date correctly:

![tz example](http://g.recordit.co/J9Y4IzO7bn.gif)

### valid_vin
Check that a Vehicle Identification Number (VIN) is valid.

Examples: 

```
$ valid_vin
Enter VIN Number: 1GCDM19X93B109951
VIN is valid

$ valid_vin
Enter VIN Number: 1GCDM19X93B109952
VIN is not valid
```

### vpn
Connect/Disconnect Viscosity VPN on macOS

To connect:
```
$ vpn
```

To disconnect: 
```
$ vpn -d
```


### vs
Open in MacVim after fuzzy search with selecta

### yrb
Disassemble Ruby source into YARV instructions.

MRI has a virtual machine called YARV (Yet Another Ruby VM), I made the `yrb` command 
to quickly disassemble ruby source code into YARV.

```
tlehman@hausdorff:~% yrb 'B=2'
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
0000 trace            1                                               (   1)
0002 putobject        2
0004 dup
0005 putspecialobject 3
0007 setconstant      :B
0009 leave
tlehman@hausdorff:~% yrb 'b=2'
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 2] b
0000 trace            1                                               (   1)
0002 putobject        2
0004 dup
0005 setlocal_OP__WC__0 2
0007 leave
tlehman@hausdorff:~% yrb 'b=(2.nil? ? :a : :b)'
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 2] b
0000 trace            1                                               (   1)
0002 putobject        2
0004 opt_send_without_block <callinfo!mid:nil?, argc:0, ARGS_SIMPLE>
0006 branchunless     12
0008 putobject        :a
0010 jump             14
0012 putobject        :b
0014 dup
0015 setlocal_OP__WC__0 2
0017 leave
```

And finally, using `yrb` to disassemble itself:


```
tlehman@hausdorff:~% yrb ~/bin/yrb
== disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
local table (size: 3, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 3] arg        [ 2] src
0000 trace            1                                               (   4)
0002 putself
0003 putstring        "ripper"
0005 opt_send_without_block <callinfo!mid:require, argc:1, FCALL|ARGS_SIMPLE>
0007 pop
0008 trace            1                                               (   6)
0010 getinlinecache   17, <is:0>
0013 getconstant      :ARGV
0015 setinlinecache   <is:0>
0017 opt_send_without_block <callinfo!mid:first, argc:0, ARGS_SIMPLE>
0019 setlocal_OP__WC__0 3
0021 trace            1                                               (   7)
0023 getinlinecache   30, <is:1>
0026 getconstant      :File
0028 setinlinecache   <is:1>
0030 getlocal_OP__WC__0 3
0032 opt_send_without_block <callinfo!mid:exist?, argc:1, ARGS_SIMPLE>
0034 branchunless     53
0036 trace            1                                               (   9)
0038 getinlinecache   45, <is:2>
0041 getconstant      :File
0043 setinlinecache   <is:2>
0045 getlocal_OP__WC__0 3
0047 opt_send_without_block <callinfo!mid:open, argc:1, ARGS_SIMPLE>
0049 opt_send_without_block <callinfo!mid:read, argc:0, ARGS_SIMPLE>
0051 jump             57                                              (   7)
0053 trace            1                                               (  11)
0055 getlocal_OP__WC__0 3
0057 setlocal_OP__WC__0 2                                             (   7)
0059 trace            1                                               (  14)
0061 getinlinecache   68, <is:3>
0064 getconstant      :Ripper
0066 setinlinecache   <is:3>
0068 getlocal_OP__WC__0 2
0070 opt_send_without_block <callinfo!mid:sexp, argc:1, ARGS_SIMPLE>
0072 opt_send_without_block <callinfo!mid:nil?, argc:0, ARGS_SIMPLE>
0074 branchunless     79
0076 putnil
0077 leave
0078 pop
0079 trace            1                                               (  15)
0081 putself
0082 getinlinecache   91, <is:4>
0085 getconstant      :RubyVM
0087 getconstant      :InstructionSequence
0089 setinlinecache   <is:4>
0091 getlocal_OP__WC__0 2
0093 opt_send_without_block <callinfo!mid:compile, argc:1, ARGS_SIMPLE>
0095 opt_send_without_block <callinfo!mid:disasm, argc:0, ARGS_SIMPLE>
0097 opt_send_without_block <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>
0099 leave
```
