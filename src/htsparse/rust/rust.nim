{.compile: "rust_parser.c".}
{.compile: "rust_scanner.c".}
{.passl: "-ltree-sitter".}

import rust_wrapper
export rust_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const rustNodeKindMap* = toMapArray {
  rustBlockComment, rustLineComment: tskComment
}

proc treeRepr*(
  node: RustNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, rustNodeKindMap, withUnnamed)
