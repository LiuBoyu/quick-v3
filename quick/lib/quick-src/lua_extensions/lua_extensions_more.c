
#include "lua_extensions_more.h"

#if __cplusplus
extern "C" {
#endif

#include "cjson/lua_cjson.h"
#include "zlib/lua_zlib.h"
#include "filesystem/lfs.h"
#include "bitop/bit.h"

#include "sproto/lsproto.h"
#include "lpack/lpack.h"
#include "lpeg/lpeg.h"

#if CC_USE_SQLITE
#include "lsqlite3/lsqlite3.h"
#endif

static luaL_Reg luax_exts[] = {
    {"cjson", luaopen_cjson_safe},
    {"zlib", luaopen_zlib},
    {"lfs", luaopen_lfs},
    {"bit", luaopen_bit},
    {"sproto.core", luaopen_sproto_core},
    {"pack", luaopen_pack},
    {"lpeg", luaopen_lpeg},
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
