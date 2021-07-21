{.passl: "-lstdc++".}
{.passl: "-ltree-sitter".}
{.compile: "latex_parser.c".}

{.compile: "src/latex_scanner.cc".}
{.compile: "src/latex_catcode.cc".}
{.compile: "src/latex_scanner_control_sequences.cc".}
{.compile: "src/latex_scanner_keywords.cc".}
{.compile: "src/latex_scanner_names.cc".}
{.compile: "src/latex_scanner_environments.cc".}

import latex_wrapper
export latex_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const latexNodeKindMap* = toMapArray {
  latexComment: tskComment
}

import ../common

initTreeRepr("Latex", 5, latexNodeKindMap)

# proc treeRepr*(
#     node: LatexNode | TsLatexNode,
#     base: string, withUnnamed: bool = false): string =
#   treeRepr(node, base, 5, latexNodeKindMap, withUnnamed)
