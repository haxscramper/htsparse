{.compile: "cpp_parser.c".}
{.compile: "cpp_scanner.cc".}
{.passl: "-ltree-sitter".}
{.passl: "-lstdc++".}

import cpp_wrapper
export cpp_wrapper


import
  hmisc/wrappers/treesitter,
  hmisc/core/all,
  hmisc/algo/[halgorithm, clformat]

export treesitter, clformat

const cppNodeKindMap* = toMapArray {
  cppComment: tskComment
}

import ../common
initTreeRepr("Cpp", 3, cppNodeKindMap)

# proc treeRepr*(
#   node: CppNode | TsCppNode, base: string, withUnnamed: bool = false): string =
#   treeRepr(node, base, 3, cppNodeKindMap, withUnnamed)
