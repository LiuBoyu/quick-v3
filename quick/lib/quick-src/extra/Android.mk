LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := extra_static
LOCAL_MODULE_FILENAME := libextra

LOCAL_SRC_FILES := luabinding/cocos2dx_extra_luabinding.cpp \
                   luabinding/HelperFunc_luabinding.cpp \
                   apptools/HelperFunc.cpp \
                   crypto/CCCrypto.cpp \
                   crypto/base64/libbase64.c \
                   platform/android/CCCryptoAndroid.cpp \
                   platform/android/CCNativeAndroid.cpp \
                   platform/android/CCNetworkAndroid.cpp

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/luabinding \
                           $(LOCAL_PATH)

LOCAL_C_INCLUDES        := $(LOCAL_PATH)/luabinding \
                           $(LOCAL_PATH) \
                           $(COCOS2DX_ROOT)/cocos/scripting/lua-bindings/manual \
                           $(COCOS2DX_ROOT)/cocos \
                           $(COCOS2DX_ROOT)/external/lua/luajit/include \
                           $(COCOS2DX_ROOT)/external/lua/tolua \
                           $(COCOS2DX_ROOT)/external

LOCAL_STATIC_LIBRARIES :=

ifeq ($(CC_USE_CURL), 1)
LOCAL_SRC_FILES += network/CCHTTPRequest.cpp

LOCAL_STATIC_LIBRARIES += cocos_curl_static
endif

ifeq ($(CC_USE_FILTER), 1)
LOCAL_SRC_FILES += luabinding/lua_cocos2dx_filter_auto.cpp \
                   filters/filters/CCFilter.cpp \
                   filters/filters/CCBlurFilter.cpp \
                   filters/filters/CCBrightnessFilter.cpp \
                   filters/filters/CCContrastFilter.cpp \
                   filters/filters/CCDropShadowFilter.cpp \
                   filters/filters/CCExposureFilter.cpp \
                   filters/filters/CCGammaFilter.cpp \
                   filters/filters/CCGrayFilter.cpp \
                   filters/filters/CCHazeFilter.cpp \
                   filters/filters/CCHueFilter.cpp \
                   filters/filters/CCMaskFilter.cpp \
                   filters/filters/CCRGBFilter.cpp \
                   filters/filters/CCSaturationFilter.cpp \
                   filters/filters/CCSepiaFilter.cpp \
                   filters/filters/CCSharpenFilter.cpp \
                   filters/filters/CCTestFilter.cpp \
                   filters/filters/CCCustomFilter.cpp \
                   filters/nodes/CCFilteredSprite.cpp \
                   filters/shaders/ccFilterShaders.cpp
endif

ifeq ($(CC_USE_NANOVG), 1)
LOCAL_SRC_FILES += luabinding/lua_cocos2dx_nanovg_manual.cpp \
                   luabinding/lua_cocos2dx_nanovg_auto.cpp \
                   nanovg/nanonode/NVGDrawNode.cpp \
                   nanovg/nanonode/NVGNode.cpp \
                   nanovg/nanovg/nanovg.c
endif

include $(BUILD_STATIC_LIBRARY)
