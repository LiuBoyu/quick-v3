LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocostudio_static
LOCAL_MODULE_FILENAME := libcocostudio

LOCAL_SRC_FILES := CCArmature.cpp \
                   CCArmatureAnimation.cpp \
                   CCArmatureDataManager.cpp \
                   CCArmatureDefine.cpp \
                   CCBatchNode.cpp \
                   CCBone.cpp \
                   CCColliderDetector.cpp \
                   CCDataReaderHelper.cpp \
                   CCDatas.cpp \
                   CCDecorativeDisplay.cpp \
                   CCDisplayFactory.cpp \
                   CCDisplayManager.cpp \
                   CCProcessBase.cpp \
                   CCSkin.cpp \
                   CCSpriteFrameCacheHelper.cpp \
                   CCTransformHelp.cpp \
                   CCTween.cpp \
                   CCUtilMath.cpp

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_C_INCLUDES        := $(LOCAL_PATH)/.. \
                           $(LOCAL_PATH)/../.. \
                           $(LOCAL_PATH)/../../../external/tinyxml2

LOCAL_CFLAGS := -fexceptions

include $(BUILD_STATIC_LIBRARY)
