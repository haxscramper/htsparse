{.compile: "html_parser.c".}
{.compile: "scanner.cc".}
{.passl: "-ltree-sitter".}

import html_wrapper
export html_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

import ../common

const htmlNodeKindMap* = toMapArray {
  htmlComment: tskComment
}


initTreeRepr("Html", 4, htmlNodeKindMap)

# proc treeRepr*(
#   node: HtmlNode | TsHtmlNode, base: string, withUnnamed: bool = false): string =
#   treeRepr(node, base, 4, htmlNodeKindMap, withUnnamed)
