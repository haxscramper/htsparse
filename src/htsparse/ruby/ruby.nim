{.compile: "ruby_parser.c".}
{.compile: "ruby_scanner.cc".}
{.passl: "-ltree-sitter".}

import ruby_wrapper
export ruby_wrapper

import ../common

const rubyNodeKindMap* = toMapArray {
  rubyComment: tskComment
}

initTreeRepr("Ruby", 4, rubyNodeKindMap)
