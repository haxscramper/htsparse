{.compile: "make_parser.c".}
{.passl: "-ltree-sitter".}

import make_wrapper
export make_wrapper

import ../common

const makeNodeKindMap* = default(array[MakeNodeKind, TsBaseNodeKind])

initTreeRepr("Make", 4, makeNodeKindMap)
