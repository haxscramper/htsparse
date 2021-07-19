import
  htsparse/java/java

import
  hmisc/hdebug_misc,
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
