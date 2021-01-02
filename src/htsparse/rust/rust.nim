{.compile: "rust_parser.c".}
{.compile: "rust_scanner.c".}
{.passl: "-ltree-sitter".}

import rust_wrapper
export rust_wrapper
