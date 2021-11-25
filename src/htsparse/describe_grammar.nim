type
  HtsRuleKind* = enum
    hrkBlank
    hrkSeq
    hrkRepeat
    hrkRepeat1
    hrkString
    hrkRegex
    hrkChoice
    hrkSymbol

  HtsRule*[K] = ref object
    case kind*: HtsRuleKind
      of hrkString:
        strVal*: string

      of hrkSymbol:
        symbol*: K

      of hrkRepeat, hrkRepeat1:
        content*: HtsRule[K]

      of hrkBlank:
        discard

      of hrkRegex:
        rxValue*: string

      of hrkChoice, hrkSeq:
        members*: seq[HtsRule[K]]

func tsChoice*[K](args: varargs[HtsRule[K]]): HtsRule[K] =
  HtsRule[K](kind: hrkChoice, members: @args)

func tsSeq*[K](args: varargs[HtsRule[K]]): HtsRule[K] =
  HtsRule[K](kind: hrkSeq, members: @args)


func tsSymbol*[K](arg: K): HtsRule[K] =
  HtsRule[K](kind: hrkSymbol, symbol: arg)

func tsString*[K](arg: string): HtsRule[K] =
  HtsRule[K](kind: hrkString, strVal: arg)

func tsRegex*[K](arg: string): HtsRule[K] =
  HtsRule[K](kind: hrkRegex, rxValue: arg)

func tsRepeat*[K](arg: HtsRule[K]): HtsRule[K] =
  HtsRule[K](kind: hrkRepeat, content: arg)

func tsRepeat1*[K](arg: HtsRule[K]): HtsRule[K] =
  HtsRule[K](kind: hrkRepeat1, content: arg)

func tsBlank*[K](): HtsRule[K] = HtsRule[K](kind: hrkBlank)
