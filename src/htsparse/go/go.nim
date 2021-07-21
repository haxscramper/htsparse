{.compile: "go_parser.c".}
{.passl: "-ltree-sitter".}

import go_wrapper
export go_wrapper

import ../common

const goNodeKindMap* = toMapArray {
  goComment: tskComment
}

initTreeRepr("Go", 2, goNodeKindMap)