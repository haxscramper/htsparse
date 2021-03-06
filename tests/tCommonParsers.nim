import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  toml/toml,
  cpp/cpp,
  java/java,
  html/html,
  latex/latex,
  scala/scala,
  ruby/ruby,
  rust/rust,
  lua/lua,
  php/php,
  bash/bash,
  c/c,
  csharp/csharp,
  css/css,
  embeddedTemplate/embedded_template,
  go/go,
  vhdl/vhdl,
  kotlin/kotlin,
  zig/zig,
  systemVerilog/systemVerilog,
  julia/julia,
  dart/dart
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

  test "latex":
    let parser = newLatexParser()
    let str = r"\sin{\int}"
    echo parser.parseString(str).treeRepr(str)

  test "rust":
    let parser = newRustParser()
    let str = """
fn main() {
    // Print text to the console
    println!("Hello World!");
}
"""
    echo parser.parseString(str).treeRepr(str)

suite "Julia":
  test "julia":
    let parser = newJuliaParser()
    let str = """
import Base.Pkg.PkgError

function reqs_from_data(reqs_data)
    reqs = Dict{ByteString,VersionSet}()
    for r in reqs_data
        p = r[1]
        reqs[p] = VersionSet(VersionNumber[r[2:end]...])
    end
    reqs
end
"""

    echo parser.parseString(str).treeRepr(str)

suite "Dart":
  test "Dart":
    let str = """
class Term {
  /// Whether the term is positive or not.
  ///
  /// A positive constraint is true when a package version that matches
  /// [package] is selected; a negative constraint is true when no package
  /// versions that match [package] are selected.
  final bool isPositive;
  Term get inverse => Term(package, !isPositive);
}
"""

    echo parseDartString(str).treeRepr(str)
