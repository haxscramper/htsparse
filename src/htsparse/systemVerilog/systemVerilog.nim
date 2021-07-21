{.compile: "systemVerilog_parser.c".}
{.passl: "-ltree-sitter".}

import verilog_wrapper
export verilog_wrapper


import ../common

const verilogNodeKindMap* = toMapArray {
  verilogComment: tskComment
}

initTreeRepr("Verilog", 7, verilogNodeKindMap)
