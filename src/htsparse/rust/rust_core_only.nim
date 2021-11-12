{.compile: "rust_parser.c".}
{.compile: "rust_scanner.c".}
{.passl: "-ltree-sitter".}

import rust_wrapper_core
export rust_wrapper_core
