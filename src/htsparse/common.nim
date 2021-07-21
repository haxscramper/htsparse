import std/[macros]
import
  hmisc/wrappers/treesitter,
  hmisc/macros/argpass,
  hmisc/algo/halgorithm

export halgorithm, argpass, treesitter


macro initTreeRepr*(
    lang: static[string],
    prefixLen: int,
    kindMap: typed
  ): untyped =

  let
    tsNode = ident("Ts" & lang & "Node")
    node = ident(lang & "Node")

  result = quote do:
    proc treeRepr*(
        node {.inject.}: `tsNode` | `node`,
        base {.inject.}: string = "",
        unnamed {.inject.}: bool = false,
        indexed {.inject.}: bool = false,
        maxdepth {.inject.}: int = high(int),
        pathIndexed {.inject.}: bool = false
      ): string =

      argpass(
        treeRepr(node, base, `prefixLen`, `kindMap`),
        unnamed,
        indexed,
        maxdepth,
        pathIndexed)
