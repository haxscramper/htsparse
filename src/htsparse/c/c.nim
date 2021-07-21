{.compile: "c_parser.c".}
{.passl: "-ltree-sitter".}

import c_wrapper
export c_wrapper

import ../common

const cNodeKindMap* = toMapArray {
  cComment: tskComment
}

initTreeRepr("C", 1, cNodeKindMap)
