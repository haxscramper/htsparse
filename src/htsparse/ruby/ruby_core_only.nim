{.compile: "ruby_parser.c".}
{.compile: "ruby_scanner.cc".}
{.passl: "-ltree-sitter".}

import ruby_wrapper_core
export ruby_wrapper_core
