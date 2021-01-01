import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  toml/toml,
  cpp/cpp,
  java/java,
  html/html
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
int main() {}
"""
    echo parser.parseString(str).treeRepr(str)
    echo parser.parseString(str).treeRepr(str, true)

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

  test "html":
    let parser = newHtmlParser()
    let str = """
<body>

<h2>HTML Links</h2>
<p>HTML links are defined with the a tag:</p>

<a href="https://www.w3schools.com">This is a link</a>

</body>
"""
    echo parser.parseString(str).treeRepr(str)
