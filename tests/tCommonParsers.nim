import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  toml/toml,
  cpp/cpp
]

# {.passl: "-ltree-sitter".}
# {.passl: "-lstdc++".}


suite "Main":
  test "toml":
    let parser = newTomlParser()
    let str = """
[servers]

  # Indentation (tabs and/or spaces) is allowed but not required
  [servers.alpha]
  ip = "10.0.0.1"
  dc = "eqdc10"
"""
    echo parser.parseString(str).treeRepr(str)

  test "cpp":
    let parser = newCppParser()
    let str = """
// Your First C++ Program

#include <iostream>

int main() {
    std::cout << "Hello World!";
    return 0;
}
"""
    echo parser.parseString(str).treeRepr(str)
