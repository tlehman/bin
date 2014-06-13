#!/bin/bash
# vs (vim selecta)
# enumerate files in a git repository, select them, open in MacVim instance

git ls-files | selecta | xargs open -a MacVim

