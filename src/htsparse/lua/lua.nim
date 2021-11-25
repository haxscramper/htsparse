{.compile: "lua_parser.c".}
{.compile: "lua_scanner.cc".}
{.passl: "-ltree-sitter".}
{.passl: "-lstdc++".}

import lua_wrapper
export lua_wrapper

import ../common

const luaNodeKindMap* = toMapArray {
  luaComment: tskComment
}

initTreeRepr("Lua", 3, luaNodeKindMap)
