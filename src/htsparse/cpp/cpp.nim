{.compile: "cpp_parser.c".}
{.compile: "cpp_scanner.cc".}
{.passl: "-ltree-sitter".}
{.passl: "-lstdc++".}

import cpp_wrapper
export cpp_wrapper
