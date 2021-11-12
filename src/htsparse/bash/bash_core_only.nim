{.compile: "bash_parser.c".}
{.compile: "bash_scanner.cc".}
{.passl: "-ltree-sitter".}

import bash_wrapper_core
export bash_wrapper_core
