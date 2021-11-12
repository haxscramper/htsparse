{.compile: "graphql_parser.c".}
{.passl: "-ltree-sitter".}

import graphql_wrapper
export graphql_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

import ../common

const graphqlNodeKindMap* = toMapArray {
  graphqlComment: tskComment
}

initTreeRepr("Graphql", 7, graphqlNodeKindMap)
