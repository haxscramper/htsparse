{.compile: "lua_parser.c".}
{.compile: "lua_scanner.cc".}
{.passl: "-ltree-sitter".}

import lua_wrapper_core
export lua_wrapper_core
