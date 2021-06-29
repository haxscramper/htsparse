{.compile: "dart_parser.c".}
{.compile: "dart_scanner.c".}
{.passl: "-ltree-sitter".}


import dart_wrapper
export dart_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

let dartNodeKindMap* = toMapArray {
  dartComment, dartDocumentationComment: tskComment,
  dartFinalBuiltin, dartTypeIdentifier: tskKeyword,
  dartIdentifier: tskIdent,
  dartPrefixOperator, dartNegationOperator: tskPrefixOp
}


proc treeRepr*(
  node: DartNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, dartNodeKindMap, withUnnamed)
