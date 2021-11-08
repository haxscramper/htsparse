{.compile: "fennel_parser.c".}
{.passl: "-ltree-sitter".}

import fennel_wrapper
export fennel_wrapper
import ../common

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

let fennelNodeKindMap* = toMapArray {
  fennelComment: tskComment,
}


initTreeRepr("Fennel", 6, fennelNodeKindMap)
