{.compile: "cpp_parser.c".}
{.compile: "cpp_scanner.cc".}
{.passl: "-ltree-sitter".}
{.passl: "-lstdc++".}

import cpp_wrapper
export cpp_wrapper


import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const cppNodeKindMap* = toMapArray {
  cppComment: tskComment
}

proc treeRepr*(
  node: CppNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 3, cppNodeKindMap, withUnnamed)
