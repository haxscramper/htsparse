{.compile: "dart_parser.c".}
{.compile: "dart_scanner.c".}
{.passl: "-ltree-sitter".}


import dart_wrapper
export dart_wrapper
import ../common

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

let dartNodeKindMap* = toMapArray {
  dartComment, dartDocumentationComment: tskComment,
  dartFinalBuiltin, dartTypeIdentifier: tskKeyword,
  dartIdentifier: tskIdent,
  dartPrefixOperator, dartNegationOperator: tskPrefixOp
}


initTreeRepr("Dart", 4, dartNodeKindMap)
