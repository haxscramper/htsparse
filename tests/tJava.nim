import
  htsparse/java/java

import
  hmisc/core/all,
  hmisc/types/colorstring,
  hmisc/other/hpprint

import
  hmisc/wrappers/treesitter

startHax()

import
  std/strformat

for test in @[
  "public class A implements B { }",
  "public class A { }"
]:
  let tree = parseJavaString(test)
  echo tree.treeRepr()
  echo "----"
  # for name in [true, false]:
  #   echo &"'{test}', named = {name}"
  #   echo treeReprTsJava(test, unnamed = name)
