{.compile: "julia_parser.c".}
{.compile: "julia_scanner.c".}
{.passl: "-ltree-sitter".}

import julia_wrapper
export julia_wrapper
import ../common

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const juliaNodeKindMap* = toMapArray {
  juliaComment: tskComment
}

initTreeRepr("Julia", 5, juliaNodeKindMap)

# proc treeRepr*(
#   node: JuliaNode, base: string, withUnnamed: bool = false): string =
#   treeRepr(node, base, 5, juliaNodeKindMap, withUnnamed)
