{.compile: "bash_parser.c".}
{.compile: "bash_scanner.cc".}
{.passl: "-ltree-sitter".}

import bash_wrapper
export bash_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

import ../common

const bashNodeKindMap* = toMapArray {
  bashComment: tskComment
}

initTreeRepr("Bash", 6, bashNodeKindMap)
