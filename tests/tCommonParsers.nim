import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/toml/toml

suite "Main":
  test "test":
    let parser = newTomlParser()
    let str = """
[servers]

  # Indentation (tabs and/or spaces) is allowed but not required
  [servers.alpha]
  ip = "10.0.0.1"
  dc = "eqdc10"
"""
    echo parser.parseString(str).treeRepr(str)

