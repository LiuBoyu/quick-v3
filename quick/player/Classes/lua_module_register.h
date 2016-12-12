#ifndef __LUA_MODULE_REGISTER_H__
#define __LUA_MODULE_REGISTER_H__

// lua module
#include "ui/lua_cocos2dx_ui_manual.hpp"
#include "cocosdenshion/lua_cocos2dx_cocosdenshion_manual.h"
#include "lua/quick/lua_cocos2dx_quick_manual.hpp"

#if CC_USE_SOCKET || CC_USE_WEBSOCKET
#include "network/lua_cocos2dx_network_manual.h"
#endif

#if CC_USE_CCSTUDIO
#include "cocostudio/lua_cocos2dx_coco_studio_manual.hpp"
#endif

#if CC_USE_SPINE
#include "spine/lua_cocos2dx_spine_manual.hpp"
#endif

// lua module
#include "lua_extensions/lua_extensions_more.h"
#include "luabinding/cocos2dx_extra_luabinding.h"
#include "luabinding/HelperFunc_luabinding.h"

#if CC_USE_FILTER
#include "luabinding/lua_cocos2dx_filter_auto.hpp"
#endif
#if CC_USE_NANOVG
#include "luabinding/lua_cocos2dx_nanovg_auto.hpp"
#include "luabinding/lua_cocos2dx_nanovg_manual.hpp"
#endif

int lua_module_register(lua_State* L)
{
    //Dont' change the module register order unless you know what your are doing
    register_ui_moudle(L);
    register_cocosdenshion_module(L);

#if CC_USE_SOCKET || CC_USE_WEBSOCKET
    register_network_module(L);
#endif

#if CC_USE_CCSTUDIO
    register_cocostudio_module(L);
#endif

#if CC_USE_SPINE
    register_spine_module(L);
#endif

    luaopen_lua_extensions_more(L);

    lua_getglobal(L, "_G");
    if (lua_istable(L, -1))//stack:...,_G,
    {
        register_all_quick_manual(L);

        luaopen_cocos2dx_extra_luabinding(L);

#if CC_USE_FILTER
        register_all_cocos2dx_filter(L);
#endif
#if CC_USE_NANOVG
        register_all_cocos2dx_nanovg(L);
        register_all_cocos2dx_nanovg_manual(L);
#endif

        luaopen_HelperFunc_luabinding(L);
    }
    lua_pop(L, 1);

    return 1;
}

#endif  // __LUA_MODULE_REGISTER_H__

