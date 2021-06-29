{.compile: "dart_parser.c".}
{.compile: "dart_scanner.c".}
{.passl: "-ltree-sitter".}

import hmisc/wrappers/treesitter

import dart_wrapper
export dart_wrapper

const dartNodeKindMap* = toMapArray {
  dartComment: tskComment
}

proc treeRepr*(
  node: DartNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, dartNodeKindMap, withUnnamed)
