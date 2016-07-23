
#include "lua_extensions_more.h"

#if __cplusplus
extern "C" {
#endif

#include "cjson/lua_cjson.h"
#include "filesystem/lfs.h"
#include "zlib/lua_zlib.h"

#if CC_USE_WEBSOCKET
#include "sproto/lsproto.h"
#include "lpeg/lpeg.h"
#include "lpack/lpack.h"
#include "bitop/bit.h"
#endif

#if CC_USE_SQLITE
#include "lsqlite3/lsqlite3.h"
#endif

static luaL_Reg luax_exts[] = {
    {"cjson", luaopen_cjson_safe},
    {"lfs", luaopen_lfs},
    {"zlib", luaopen_zlib},
#if CC_USE_WEBSOCKET
    {"sproto.core", luaopen_sproto_core},
    {"lpeg", luaopen_lpeg},
    {"pack", luaopen_pack},
    {"bit", luaopen_bit},
#endif
#if CC_USE_SQLITE
    {"lsqlite3", luaopen_lsqlite3},
#endif
    {NULL, NULL}
};

void luaopen_lua_extensions_more(lua_State *L)
{
    // load extensions
    luaL_Reg* lib = luax_exts;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);
}

#if __cplusplus
} // extern "C"
#endif
