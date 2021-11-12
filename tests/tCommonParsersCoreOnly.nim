# {.warning[UnusedImport]:off.}

import std/[sugar, strutils, sequtils, strformat, unittest]
import htsparse/[
  toml/toml_core_only,
  cpp/cpp_core_only,
  java/java_core_only,
  html/html_core_only,
  latex/latex_core_only,
  scala/scala_core_only,
  ruby/ruby_core_only,
  rust/rust_core_only,
  lua/lua_core_only,
  php/php_core_only,
  bash/bash_core_only,
  c/c_core_only,
  csharp/csharp_core_only,
  css/css_core_only,
  embeddedTemplate/embedded_template_core_only,
  go/go_core_only,
  vhdl/vhdl_core_only,
  zig/zig_core_only,
  systemVerilog/systemVerilog_core_only,
  julia/julia_core_only,
  dart/dart_core_only,
  clojure/clojure_core_only,
  fennel/fennel_core_only,
  graphql/graphql_core_only,
]

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
    let node = parseTsCsharpString(str)
    echo node.treeRepr(str)

suite "bash":
  test "Parse string":
    let str = """
#!/bin/bash

# Add two numeric value
((sum=25+35))

#Print the result
echo $sum
"""
    let node = parseTsBashString(str)
    echo node.treeRepr(str)


when false:
  import htsparse/kotlin/kotlin_core_only
  suite "Kotlin":
    test "Parse string":
      let str = """
package org.kotlinlang.play         // 1

fun main() {                        // 2
    println("Hello, World!")        // 3
}
"""
    let node = parseTsKotlinString(str)
    echo node.treeRepr(str)

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
    let node = parseTsLuaString(str)
    echo node.treeRepr(str)

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
    let node = parseTsCString(str)
    echo node.treeRepr(str)

suite "Php":
  test "Parse string":
    let str = """
  $color = "black";
  echo "My car is ". $ColoR ."</br>";
  echo "My dog is ". $color ."</br>";
  echo "My Phone is ". $COLOR ."</br>";
"""
    let node = parseTsPhpString(str)
    echo node.treeRepr(str)

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
    let node = parseTsRubyString(str)
    echo node.treeRepr(str)

suite "Scala":
  test "Parse string":
    let str = """
object HelloWorld {
  def main(args: Array[String]) {
    println("Hello, world!")
  }
}
"""
    let node = parseTsScalaString(str)
    echo node.treeRepr(str)

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
    let node = parseTsCssString(str)
    echo node.treeRepr(str)

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
    let node = parseTsEmbeddedTemplateString(str)
    echo node.treeRepr(str)

suite "Go":
  test "Parse string":
    let str = """
package main

import "fmt"

func main() {
    fmt.Println("hello world")
}

"""
    let node = parseTsGoString(str)
    echo node.treeRepr(str)

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

    let node  = parseTsVhdlString(str)
    echo node.treeRepr(str)

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
    let node = parseTsZigString(str)
    echo node.treeRepr(str)

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
    let node = parseTsVerilogString(str)
    echo node.treeRepr(str)

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
    let node = parser.parseString(str)
    echo node.treeRepr(str)

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
    let node = parser.parseString(str)
    echo node.treeRepr(str)

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
    let node = parser.parseString(str)
    echo node.treeRepr(str)

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
    let node = parser.parseString(str)
    echo node.treeRepr(str)

suite "latex":
  test "Parse string":
    let parser = newTsLatexParser()
    let str = r"\sin{\int}"
    let node = parser.parseString(str)
    echo node.treeRepr(str)

suite "rust":
  test "Parse string":
    let parser = newTsRustParser()
    let str = """
fn main() {
    // Print text to the console
    println!("Hello World!");
}
"""
    let node = parser.parseString(str)
    echo node.treeRepr(str)

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

    let node = parser.parseString(str)
    echo node.treeRepr(str)

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

    let node = parseTsDartString(str)
    echo node.treeRepr(str)

suite "Clojure":
  test "Clojure":
    let str = """
(ns code-maat.parsers.svn
  (:require [code-maat.parsers.time-parser :as tp]
            [clojure.data.zip.xml :as zip-xml]
            [clojure.string :as s]))
"""

    let node = parseTsClojureString(str)
    echo node.treeRepr(str)

suite "Fennel":
  test "Fennel":
    let str = """
(fn print-and-add [a b c]
  (print a)
  (+ b c))
"""

    let node = parseTsFennelString(str)
    doAssert node.kind == fennelProgram
    echo node.treeRepr(str)

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

    let node = parseTsGraphqlString(str)
    echo node.treeRepr(str)
