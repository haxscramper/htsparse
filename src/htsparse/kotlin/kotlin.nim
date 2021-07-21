{.compile: "kotlin_parser.c".}
{.passl: "-ltree-sitter".}

import kotlin_wrapper
export kotlin_wrapper

import ../common

const kotlinNodeKindMap* = toMapArray {
  kotlinComment: tskComment
}

initTreeRepr("Kotlin", 6, kotlinNodeKindMap)
