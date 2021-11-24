{.compile: "nix_parser.c".}
{.compile: "nix_scanner.c"}
{.passl: "-ltree-sitter".}

import nix_wrapper
export nix_wrapper

import ../common

const nixNodeKindMap* = toMapArray {
  nixComment: tskComment
}

initTreeRepr("Nix", 3, nixNodeKindMap)
