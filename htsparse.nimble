# Package

version       = "0.1.4"
author        = "haxscramper"
description   = "Nim wrappers for tree-sitter parser grammars"
license       = "Apache-2.0"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"
requires "hmisc >= 0.9.0"
requires "hparse"

task docgen, "Generate documentation":
  exec("hmisc-putils docgen")

task dockerdocgen, "Generate documentation in docker container":
  exec("hmisc-putils dockerdocgen -lcligen -lhmisc -lhasts -lhnimast -lhdrawing -lhpprint -lhparse")

task dockertest, "Run tests in docker container":
  exec("""
hmisc-putils dockertest --projectDir:$(pwd) \
  -lcligen -lhmisc -lhasts -lhnimast -lhdrawing -lhpprint -lhparse \
  --preTestCmds='wget https://github.com/tree-sitter/tree-sitter/archive/0.17.3.tar.gz' \
  --preTestCmds='tar -xvf 0.17.3.tar.gz' \
  --preTestCmds='cd tree-sitter-0.17.3' \
  --preTestCmds='sudo make install PREFIX=/usr'
""")
