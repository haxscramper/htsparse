#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# bash
set -o nounset
set -o errexit

/mnt/workspace/github/hparse/src/hparse/htreesitter/hts_wrapgen.nim.bin \
    grammarFromUrl \
    --grammarUrl="https://raw.githubusercontent.com/ikatyang/tree-sitter-toml/master/grammar.js" \
    --scannerUrl="https://raw.githubusercontent.com/ikatyang/tree-sitter-toml/master/src/scanner.c"
