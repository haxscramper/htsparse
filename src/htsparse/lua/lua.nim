{.compile: "lua_parser.c".}
{.compile: "lua_scanner.cc".}
{.passl: "-ltree-sitter".}

import lua_wrapper
export lua_wrapper
