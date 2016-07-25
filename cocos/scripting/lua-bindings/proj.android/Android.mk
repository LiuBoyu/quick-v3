LOCAL_PATH := $(call my-dir)

#==============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2d_lua_android_static
LOCAL_MODULE_FILENAME := libluacocos2dandroid

LOCAL_SRC_FILES := ../manual/platform/android/jni/Java_org_cocos2dx_lib_Cocos2dxLuaJavaBridge.cpp \
                   ../manual/platform/android/CCLuaJavaBridge.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../manual/platform/android/jni \
                    $(LOCAL_PATH)/../manual/platform/android \
                    $(LOCAL_PATH)/../manual \
                    $(LOCAL_PATH)/../../../../external/lua/tolua \
                    $(LOCAL_PATH)/../../..

LOCAL_EXPORT_LDLIBS := -lGLESv2 \
                       -llog \
                       -lz \
                       -landroid

LOCAL_STATIC_LIBRARIES := luajit_static

include $(BUILD_STATIC_LIBRARY)

#==============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2d_lua_static
LOCAL_MODULE_FILENAME := libluacocos2d

LOCAL_SRC_FILES := ../manual/CCLuaBridge.cpp \
                   ../manual/CCLuaEngine.cpp \
                   ../manual/CCLuaStack.cpp \
                   ../manual/CCLuaValue.cpp \
                   ../manual/LuaBasicConversions.cpp \
                   ../manual/Cocos2dxLuaLoader.cpp \
                   ../manual/cocos2d/LuaScriptHandlerMgr.cpp \
                   ../manual/cocos2d/LuaOpengl.cpp \
                   ../manual/tolua_fix.cpp \
                   ../../../../external/lua/tolua/tolua_event.c \
                   ../../../../external/lua/tolua/tolua_is.c \
                   ../../../../external/lua/tolua/tolua_map.c \
                   ../../../../external/lua/tolua/tolua_push.c \
                   ../../../../external/lua/tolua/tolua_to.c \
                   ../../../../external/xxtea/xxtea.cpp

LOCAL_SRC_FILES += ../manual/cocos2d/lua_cocos2dx_manual.cpp \
                   ../auto/lua_cocos2dx_auto.cpp

LOCAL_SRC_FILES += ../manual/ui/lua_cocos2dx_ui_manual.cpp \
                   ../auto/lua_cocos2dx_ui_auto.cpp

LOCAL_SRC_FILES += ../manual/cocosdenshion/lua_cocos2dx_cocosdenshion_manual.cpp \
                   ../auto/lua_cocos2dx_cocosdenshion_auto.cpp

LOCAL_SRC_FILES += ../../../../external/lua/quick/lua_cocos2dx_quick_manual.cpp \
                   ../../../../external/lua/quick/LuaEventNode.cpp \
                   ../../../../external/lua/quick/LuaNodeManager.cpp \
                   ../../../../external/lua/quick/LuaTouchEventManager.cpp \
                   ../../../../external/lua/quick/LuaTouchTargetNode.cpp

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../../external/lua/luajit/include \
                           $(LOCAL_PATH)/../../../../external/lua/tolua \
                           $(LOCAL_PATH)/../../../../external/lua/quick \
                           $(LOCAL_PATH)/../../../.. \
                           $(LOCAL_PATH)/../manual/cocos2d \
                           $(LOCAL_PATH)/../manual/ui \
                           $(LOCAL_PATH)/../manual/cocosdenshion \
                           $(LOCAL_PATH)/../manual \
                           $(LOCAL_PATH)/../auto

LOCAL_C_INCLUDES        := $(LOCAL_PATH)/../../../../external/lua/luajit/include \
                           $(LOCAL_PATH)/../../../../external/lua/tolua \
                           $(LOCAL_PATH)/../../../../external/lua/quick \
                           $(LOCAL_PATH)/../../../../external/lua \
                           $(LOCAL_PATH)/../../../../external/xxtea \
                           $(LOCAL_PATH)/../../../.. \
                           $(LOCAL_PATH)/../../../2d \
                           $(LOCAL_PATH)/../../../ui \
                           $(LOCAL_PATH)/../manual/cocos2d \
                           $(LOCAL_PATH)/../manual/ui \
                           $(LOCAL_PATH)/../manual/cocosdenshion \
                           $(LOCAL_PATH)/../manual \
                           $(LOCAL_PATH)/../auto

ifeq ($(CC_USE_WEBSOCKET), 1)
LOCAL_SRC_FILES += ../manual/network/lua_cocos2dx_network_manual.cpp \
                   ../manual/network/Lua_web_socket.cpp

LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../manual/network

LOCAL_C_INCLUDES        += $(LOCAL_PATH)/../manual/network \
                           $(LOCAL_PATH)/../../../network
endif

ifeq ($(CC_USE_CCSTUDIO), 1)
LOCAL_SRC_FILES += ../manual/cocostudio/lua_cocos2dx_coco_studio_manual.cpp \
                   ../auto/lua_cocos2dx_studio_auto.cpp

LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../manual/cocostudio

LOCAL_C_INCLUDES        += $(LOCAL_PATH)/../manual/cocostudio \
                           $(LOCAL_PATH)/../../../editor-support/cocostudio
endif

ifeq ($(CC_USE_SPINE), 1)
LOCAL_SRC_FILES += ../manual/spine/lua_cocos2dx_spine_manual.cpp \
                   ../manual/spine/LuaSkeletonAnimation.cpp \
                   ../auto/lua_cocos2dx_spine_auto.cpp

LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../manual/spine

LOCAL_C_INCLUDES        += $(LOCAL_PATH)/../manual/spine \
                           $(LOCAL_PATH)/../../../editor-support/spine
endif

ifeq ($(CC_USE_PHYSICS), 1)
LOCAL_SRC_FILES += ../manual/cocos2d/lua_cocos2dx_physics_manual.cpp \
                   ../auto/lua_cocos2dx_physics_auto.cpp
endif

ifeq ($(CC_USE_TMX), 1)
LOCAL_SRC_FILES += ../manual/cocos2d/lua_cocos2dx_experimental_manual.cpp \
                   ../auto/lua_cocos2dx_experimental_auto.cpp
endif

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2d_lua_android_static

LOCAL_STATIC_LIBRARIES := cocos2dx_static

include $(BUILD_STATIC_LIBRARY)

$(call import-module, external/lua/luajit/prebuilt/android)
$(call import-module, cocos)
