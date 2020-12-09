import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  toml/toml,
  cpp/cpp,
  java/java
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
int main() {}
"""
    echo parser.parseString(str).treeRepr(str)

  test "java":
    let parser = newJavaParser()
    let str = """
class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}
"""
    echo parser.parseString(str).treeRepr(str)
