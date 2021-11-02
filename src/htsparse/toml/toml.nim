{.compile: "toml_parser.c".}
{.compile: "toml_scanner.c".}
{.passl: "-ltree-sitter".}

import toml_wrapper
export toml_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

import ../common

const tomlNodeKindMap* = toMapArray {
  tomlComment: tskComment
}

initTreeRepr("Toml", 4, tomlNodeKindMap)

# proc treeRepr*(
#   node: TomlNode | TsTomlNode, base: string, withUnnamed: bool = false): string =
#   treeRepr(node, base, 4, tomlNodeKindMap, withUnnamed)
