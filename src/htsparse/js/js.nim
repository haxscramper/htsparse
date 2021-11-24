{.compile: "js_parser.c".}
{.compile: "js_scanner.c".}
{.passl: "-ltree-sitter".}

import js_wrapper
export js_wrapper

import ../common

const jsNodeKindMap* = toMapArray {
  jsComment: tskComment
}

initTreeRepr("Js", 2, jsNodeKindMap)
