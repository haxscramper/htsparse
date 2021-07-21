{.compile: "scala_parser.c".}
{.compile: "scala_scanner.c".}
{.passl: "-ltree-sitter".}

import scala_wrapper
export scala_wrapper

import ../common

const scalaNodeKindMap* = toMapArray {
  scalaComment: tskComment
}

initTreeRepr("Scala", 6, scalaNodeKindMap)
