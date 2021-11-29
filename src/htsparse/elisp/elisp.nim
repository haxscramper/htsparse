{.compile: "elisp_parser.c".}
{.passl: "-ltree-sitter".}

import elisp_wrapper
export elisp_wrapper

import ../common

const elispNodeKindMap* = default(array[ElispNodeKind, TsBaseNodeKind])

initTreeRepr("Elisp", 5, elispNodeKindMap)
