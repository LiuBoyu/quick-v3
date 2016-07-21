LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := lua_extensions_static
LOCAL_MODULE_FILENAME := libluaextensions

LOCAL_SRC_FILES := lua_extensions_more.c

LOCAL_SRC_FILES += cjson/lua_cjson.c \
                   cjson/fpconv.c \
                   cjson/strbuf.c
                   zlib/lua_zlib.c \
                   filesystem/lfs.c \
                   bitop/bit.c

LOCAL_SRC_FILES += sproto/lsproto.c \
                   sproto/sproto.c \
                   lpack/lpack.c \
                   lpeg/lpcap.c \
                   lpeg/lpcode.c \
                   lpeg/lpprint.c \
                   lpeg/lptree.c \
                   lpeg/lpvm.c

ifeq ($(CC_USE_SQLITE), 1)
LOCAL_SRC_FILES += lsqlite3/sqlite3.c \
                   lsqlite3/lsqlite3.c
endif

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/cjson \
                           $(LOCAL_PATH)/zlib \
                           $(LOCAL_PATH)/filesystem \
                           $(LOCAL_PATH)/bitop \
                           $(LOCAL_PATH)/sproto \
                           $(LOCAL_PATH)/lpack \
                           $(LOCAL_PATH)/lpeg \
                           $(LOCAL_PATH)/lsqlite3 \
                           $(LOCAL_PATH)/

LOCAL_C_INCLUDES := $(LOCAL_PATH)/cjson \
                    $(LOCAL_PATH)/zlib \
                    $(LOCAL_PATH)/filesystem \
                    $(LOCAL_PATH)/bitop \
                    $(LOCAL_PATH)/sproto \
                    $(LOCAL_PATH)/lpack \
                    $(LOCAL_PATH)/lpeg \
                    $(LOCAL_PATH)/lsqlite3 \
                    $(LOCAL_PATH)/ \
                    $(COCOS2DX_ROOT)/external/lua/luajit/include \
                    $(COCOS2DX_ROOT)/cocos

include $(BUILD_STATIC_LIBRARY)
