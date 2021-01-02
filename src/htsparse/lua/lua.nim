{.compile: "lua_parser.c".}
{.compile: "lua_scanner.c".}
{.passl: "-ltree-sitter".}

import lua_wrapper
export lua_wrapper
