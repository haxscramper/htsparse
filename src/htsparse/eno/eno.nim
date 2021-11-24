{.compile: "eno_parser.c".}
{.compile: "eno_scanner.cc".}
{.passl: "-ltree-sitter".}

import eno_wrapper
export eno_wrapper

import ../common

const enoNodeKindMap* = toMapArray {
  enoComment: tskComment
}

initTreeRepr("Eno", 3, enoNodeKindMap)
