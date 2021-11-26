# {.warning[UnusedImport]:off.}

import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  agda/agda,
  bash/bash,
  c/c,
  clojure/clojure,
  cpp/cpp,
  csharp/csharp,
  css/css,
  dart/dart,
  embeddedTemplate/embedded_template,
  eno/eno,
  fennel/fennel,
  go/go,
  graphql/graphql,
  html/html,
  java/java,
  js/js,
  julia/julia,
  kotlin/kotlin,
  latex/latex,
  lua/lua,
  nix/nix,
  php/php,
  python/python,
  ruby/ruby,
  rust/rust,
  scala/scala,
  systemVerilog/systemVerilog,
  systemrdl/systemrdl,
  toml/toml,
  vhdl/vhdl,
  zig/zig,
]

# {.passl: "-ltree-sitter".}
# {.passl: "-lstdc++".}

suite "Test":
  discard


suite "Main":
  test "csharp":
    let str = """
using System;

namespace HelloWorld
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Hello World!");
    }
  }
}
"""
    let parser = newTsCsharpParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseCsharpString(str).treeRepr()



suite "bash":
  test "Parse string":
    let str = """
#!/bin/bash

# Add two numeric value
((sum=25+35))

#Print the result
echo $sum
"""
    let parser = newTsBashParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseBashString(str).treeRepr()



when false:
  import htsparse/kotlin/kotlin
  suite "Kotlin":
    test "Parse string":
      let str = """
package org.kotlinlang.play         // 1

fun main() {                        // 2
    println("Hello, World!")        // 3
}
"""
      let parser = newTsKotlinParser()
      discard parser.parseString(str).treeRepr(str)
      echo parseKotlinString(str).treeRepr()

suite "Lua":
  test "Parse string":
    let str = """
-- defines a factorial function
function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

print("enter a number:")
a = io.read("*number")        -- read a number
print(fact(a))
"""
    let parser = newTsLuaParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseLuaString(str).treeRepr()


    echo parser.parseString("1 + 2").treeRepr("1 + 2", unnamed = true)
    echo parser.parseString("1 + 2").treeRepr("1 + 2", unnamed = false)


suite "C":
  test "Parse string":
    let str = """
#include <stdio.h>
int main() {
   // printf() displays the string inside quotation
   printf("Hello, World!");
   return 0;
}
"""
    let parser = newTsCParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseCString(str).treeRepr()

suite "Php":
  test "Parse string":
    let str = """
  $color = "black";
  echo "My car is ". $ColoR ."</br>";
  echo "My dog is ". $color ."</br>";
  echo "My Phone is ". $COLOR ."</br>";
"""
    let parser = newTsPhpParser()
    discard parser.parseString(str).treeRepr(str)
    echo parsePhpString(str).treeRepr()

suite "Ruby":
  test "Parse string":
    let str = """
def find_missing(sequence)
  consecutive     = sequence.each_cons(2)
  differences     = consecutive.map { |a,b| b - a }
  sequence        = differences.max_by { |n| differences.count(n) }
  missing_between = consecutive.find { |a,b| (b - a) != sequence }
  missing_between.first + sequence
end
find_missing([2,4,6,10])
# 8
"""
    let parser = newTsRubyParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseRubyString(str).treeRepr()

suite "Scala":
  test "Parse string":
    let str = """
object HelloWorld {
  def main(args: Array[String]) {
    println("Hello, world!")
  }
}
"""
    let parser = newTsScalaParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseScalaString(str).treeRepr()

suite "Css":
  test "Parse string":
    let str = """
body {
  background-color: powderblue;
}
h1 {
  color: blue;
}
p {
  color: red;
}
"""
    let parser = newTsCssParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseCssString(str).treeRepr()

suite "EmbeddedTemplate":
  test "Parse string":
    let str = """
<div>
  <% names.each do |name| _%>
    <div>
      <%= name -%>
    </div>
    <span>
      <% something() -%>
    </span>
  <%_ end %>
</div>
"""
    let parser = newTsEmbeddedTemplateParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseEmbeddedTemplateString(str).treeRepr()

suite "Go":
  test "Parse string":
    let str = """
package main

import "fmt"

func main() {
    fmt.Println("hello world")
}

"""
    let parser = newTsGoParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseGoString(str).treeRepr()

suite "Vhdl":
  test "Parse string":
    let str = """
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab15_p4a is
    Port ( a_A, a_B, a_C : in STD_LOGIC;
           a_Y : out STD_LOGIC);
end lab15_p4a;

architecture Behavioral of lab15_p4a is
begin
    a_Y <= ((not a_A) and a_C) or (a_A and (not a_B) and (not a_C));
end Behavioral;
"""
    let parser = newTsVhdlParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseVhdlString(str).treeRepr()

suite "Zig":
  test "Parse string":
    let str = """
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var i: usize = 1;
    while (i <= 16) : (i += 1) {
        if (i % 15 == 0) {
            try stdout.writeAll("ZiggZagg\n");
        } else if (i % 3 == 0) {
            try stdout.writeAll("Zigg\n");
        } else if (i % 5 == 0) {
            try stdout.writeAll("Zagg\n");
        } else {
            try stdout.print("{d}\n", .{i});
        }
    }
}
"""
    let parser = newTsZigParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseZigString(str).treeRepr()

suite "SystemVerilog":
  test "Parse string":
    let str = """
module jbuffertb;
	reg a;
	wire y;
	jbuffer jbuf(a,y);
	initial
	begin
		$display ("RESULT\ta\ty");

		a = 0; # 100; // Initial value is set
		if ( y == 0 ) // Test for inversion
			$display ("PASS\t%d\t%d",a,y);
		else
			$display ("FAIL\t%d\t%d",a,y);

		a = 1; # 100; // Another value
		if ( y == 1 ) // Test for inversion
			$display ("PASS\t%d\t%d",a,y);
		else
			$display ("FAIL\t%d\t%d",a,y);

		a = 2; # 100; // Dummy value
	end

  //enabling the wave dump
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
"""
    let parser = newTsVerilogParser()
    discard parser.parseString(str).treeRepr(str)
    echo parseVerilogString(str).treeRepr()

suite "toml":
  test "Parse string":
    let parser = newTsTomlParser()
    let str = """
[servers]

  # Indentation (tabs and/or spaces) is allowed but not required
  [servers.alpha]
  ip = "10.0.0.1"
  dc = "eqdc10"
"""
    echo parser.parseString(str).treeRepr(str)

suite "cpp":
  test "Parse string":
    let parser = newTsCppParser()
    let str = """
class Counter {
    Q_PROPERTY(QColor color MEMBER m_color NOTIFY colorChanged)

    public slots: void setValue(int value);
    public: void test();
};
"""
    echo parser.parseString(str).treeRepr(str)
    echo parser.parseString(str).treeRepr(str, true)

  test "Readme":
    let str = """
int main () {
  std::cout << "Hello world";
}
"""

    echo parseCppString(str).treeRepr()

suite "java":
  test "Parse string":
    let parser = newTsJavaParser()
    let str = """
class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}
"""
    echo parser.parseString(str).treeRepr(str)



suite "html":
  test "Parse string":
    let parser = newTsHtmlParser()
    let str = """
<body>

<h2>HTML Links</h2>
<p>HTML links are defined with the a tag:</p>

<a href="https://www.w3schools.com">This is a link</a>

</body>
"""
    echo parser.parseString(str).treeRepr(str)

suite "latex":
  test "Parse string":
    let parser = newTsLatexParser()
    let str = r"\sin{\int}"
    echo parser.parseString(str).treeRepr(str)

suite "rust":
  test "Parse string":
    let parser = newTsRustParser()
    let str = """
fn main() {
    // Print text to the console
    println!("Hello World!");
}
"""
    echo parser.parseString(str).treeRepr(str)

suite "Julia":
  test "julia":
    let parser = newTsJuliaParser()
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

suite "Clojure":
  test "Clojure":
    let str = """
(ns code-maat.parsers.svn
  (:require [code-maat.parsers.time-parser :as tp]
            [clojure.data.zip.xml :as zip-xml]
            [clojure.string :as s]))
"""

    echo parseClojureString(str).treeRepr(str)

suite "Fennel":
  test "Fennel":
    let str = """
(fn print-and-add [a b c]
  (print a)
  (+ b c))
"""

    echo parseFennelString(str).treeRepr(str)

suite "Graphql":
  test "Graphql":
    let str = """
{
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}

fragment comparisonFields on Character {
  name
  appearsIn
  friends {
    name
  }
}
"""

    echo parseGraphqlString(str).treeRepr(str)


suite "Js":
  test "Js":
    let str = """
// `return` keyword, otherwise you'll always return `undefined` due to
// automatic semicolon insertion. Watch out for this when using Allman style.
function myFunction(){
    return // <- semicolon automatically inserted here
    {thisIsAn: 'object literal'};
}
myFunction(); // = undefined
"""

    echo parseJsString(str).treeRepr(str)


suite "Nix":
  test "Nix":
    let str = """
buildPythonPackage rec {
  pname = "hello";
  version = "1.0";
  src = fetchPypi {
    inherit pname version;
   sha256 = "01ba..0";
  };
}
"""

    echo parseNixString(str).treeRepr(str)


suite "Eno":
  test "Eno":
    let str = """

# cities
Den Haag: 52.069961, 4.302315
Málaga: 36.721447, -4.421291
서울특별시: 37.566984, 126.977041
"""

    echo parseEnoString(str).treeRepr(str)
