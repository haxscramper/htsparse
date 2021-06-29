{.compile: "html_parser.c".}
{.compile: "scanner.cc".}
{.passl: "-ltree-sitter".}

import html_wrapper
export html_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const htmlNodeKindMap* = toMapArray {
  htmlComment: tskComment
}

proc treeRepr*(
  node: HtmlNode, base: string, withUnnamed: bool = false): string =
  treeRepr(node, base, 4, htmlNodeKindMap, withUnnamed)
