{.compile: "csharp_parser.c".}
{.compile: "csharp_scanner.c"}
{.passl: "-ltree-sitter".}

import c_sharp_wrapper
export c_sharp_wrapper

import ../common

const
  csharpNodeKindMap* = toMapArray {
    c_sharpComment: tskComment
  }

initTreeRepr("Csharp", 6, csharpNodeKindMap)
