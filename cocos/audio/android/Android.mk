LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocosdenshion_static
LOCAL_MODULE_FILENAME := libcocosdenshion

LOCAL_SRC_FILES := jni/cddandroidAndroidJavaEngine.cpp \
                   cddSimpleAudioEngine.cpp \
                   ccdandroidUtils.cpp

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include \
                    $(LOCAL_PATH)/../../platform/android \
                    $(LOCAL_PATH)/../..

include $(BUILD_STATIC_LIBRARY)
