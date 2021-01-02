{.compile: "python_parser.c".}
{.compile: "python_scanner.cc".}
{.passl: "-ltree-sitter".}

import python_wrapper
export python_wrapper
