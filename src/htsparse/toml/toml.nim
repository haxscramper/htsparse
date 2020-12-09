{.compile: "toml_parser.c".}
{.compile: "toml_scanner.c".}
{.passl: "-ltree-sitter".}

import toml_wrapper
export toml_wrapper
