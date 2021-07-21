{.compile: "vhdl_parser.c".}
{.passl: "-ltree-sitter".}

import vhdl_wrapper
export vhdl_wrapper



import ../common

const vhdlNodeKindMap* = toMapArray {
  vhdlComment: tskComment
}

initTreeRepr("Vhdl", 4, vhdlNodeKindMap)