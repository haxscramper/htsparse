{.compile: "java_parser.c".}
{.passl: "-ltree-sitter".}

import java_wrapper
export java_wrapper

import
  hmisc/wrappers/treesitter,
  hmisc/algo/halgorithm

const
  javaPrimitiveTypes* = {
    javaFloatingPointType,
    javaIntegralType,
    javaVoidType,
    javaBooleanType
  }

  javaNodeKindMap* = toMapArray {
    { javaComment }: tskComment,
    javaPrimitiveTypes: tskPrimitiveType
  }

import ../common

initTreeRepr("Java", 4, javaNodeKindMap)

# proc treeRepr*(
#     node: TsJavaNode | HtsNode[TsJavaNode, JavaNodeKind],
#     base: string = "",
#     unnamed: bool = false,
#     indexed: bool = false,
#     maxdepth: int = high(int),
#     pathIndexed: bool = false
#   ): string =

#   argpass(
#     treeRepr(node, base, 4, javaNodeKindMap),
#     unnamed,
#     indexed,
#     maxdepth,
#     pathIndexed)
