{.compile: "bash_parser.c".}
{.compile: "bash_scanner.cc".}
{.passl: "-ltree-sitter".}

import bash_wrapper
export bash_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const bashNodeKindMap* = toMapArray {
  bashComment: tskComment
}

proc treeRepr*(
  node: BashNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, bashNodeKindMap, withUnnamed)
