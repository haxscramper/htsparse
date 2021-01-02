{.compile: "ruby_parser.c".}
{.compile: "ruby_scanner.c".}
{.passl: "-ltree-sitter".}

import ruby_wrapper
export ruby_wrapper
