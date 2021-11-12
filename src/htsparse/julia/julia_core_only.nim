{.compile: "julia_parser.c".}
{.compile: "julia_scanner.c".}
{.passl: "-ltree-sitter".}

import julia_wrapper_core
export julia_wrapper_core
