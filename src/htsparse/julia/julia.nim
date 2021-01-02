{.compile: "julia_parser.c".}
{.compile: "julia_scanner.c".}
{.passl: "-ltree-sitter".}

import julia_wrapper
export julia_wrapper
