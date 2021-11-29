{.compile: "regex_parser.c".}
{.passl: "-ltree-sitter".}

import regex_wrapper
export regex_wrapper

import ../common

const regexNodeKindMap* = default(array[RegexNodeKind, TsBaseNodeKind])

initTreeRepr("Regex", 5, regexNodeKindMap)
