import std/[macros]
import
  hmisc/wrappers/treesitter,
  hmisc/macros/argpass,
  hmisc/algo/[halgorithm, clformat],
  hmisc/core/all

export halgorithm, argpass, treesitter, clformat, all


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
        opts {.inject.}: HDisplayOpts = defaultHDisplay
        # indexed {.inject.}: bool = false,
        # maxdepth {.inject.}: int = high(int),
        # pathIndexed {.inject.}: bool = false
      ): ColoredText =

      argpass(
        treeRepr(node, base, `prefixLen`, `kindMap`),
        unnamed,
        opts
        # indexed,
        # maxdepth,
        # pathIndexed
      )
