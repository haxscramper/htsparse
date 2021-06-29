{.compile: "java_parser.c".}
{.passl: "-ltree-sitter".}

import java_wrapper
export java_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const javaNodeKindMap* = toMapArray {
  javaComment: tskComment
}

proc treeRepr*(
  node: JavaNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, javaNodeKindMap, withUnnamed)
