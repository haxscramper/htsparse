{.compile: "zig_parser.c".}
{.passl: "-ltree-sitter".}

import zig_wrapper
export zig_wrapper


import ../common

const zigNodeKindMap* = toMapArray {
  zigLineComment: tskComment
}

initTreeRepr("Zig", 3, zigNodeKindMap)