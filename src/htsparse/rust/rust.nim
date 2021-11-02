{.compile: "rust_parser.c".}
{.compile: "rust_scanner.c".}
{.passl: "-ltree-sitter".}

import rust_wrapper
export rust_wrapper
import ../common

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const rustNodeKindMap* = toMapArray {
  rustBlockComment, rustLineComment: tskComment
}


initTreeRepr("Rust", 4, rustNodeKindMap)
