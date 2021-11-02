{.compile: "clojure_parser.c".}
{.passl: "-ltree-sitter".}


import clojure_wrapper
export clojure_wrapper
import ../common

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

let clojureNodeKindMap* = toMapArray {
  clojureComment: tskComment,
}


initTreeRepr("Clojure", 7, clojureNodeKindMap)
