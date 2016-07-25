LOCAL_PATH := $(call my-dir)

#==============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dx_internal_static
LOCAL_MODULE_FILENAME := libcocos2dxinternal

LOCAL_SRC_FILES := cocos2d.cpp \
                   2d/CCAction.cpp \
                   2d/CCActionCamera.cpp \
                   2d/CCActionCatmullRom.cpp \
                   2d/CCActionEase.cpp \
                   2d/CCActionGrid.cpp \
                   2d/CCActionGrid3D.cpp \
                   2d/CCActionInstant.cpp \
                   2d/CCActionInterval.cpp \
                   2d/CCActionManager.cpp \
                   2d/CCActionPageTurn3D.cpp \
                   2d/CCActionProgressTimer.cpp \
                   2d/CCActionTiledGrid.cpp \
                   2d/CCActionTween.cpp \
                   2d/CCAnimation.cpp \
                   2d/CCAnimationCache.cpp \
                   2d/CCAtlasNode.cpp \
                   2d/CCCamera.cpp \
                   2d/CCClippingNode.cpp \
                   2d/CCClippingRectangleNode.cpp \
                   2d/CCComponent.cpp \
                   2d/CCComponentContainer.cpp \
                   2d/CCDrawNode.cpp \
                   2d/CCDrawingPrimitives.cpp \
                   2d/CCFont.cpp \
                   2d/CCFontAtlas.cpp \
                   2d/CCFontAtlasCache.cpp \
                   2d/CCFontCharMap.cpp \
                   2d/CCFontFNT.cpp \
                   2d/CCFontFreeType.cpp \
                   2d/CCGLBufferedNode.cpp \
                   2d/CCGrabber.cpp \
                   2d/CCGrid.cpp \
                   2d/CCLabel.cpp \
                   2d/CCLabelAtlas.cpp \
                   2d/CCLabelBMFont.cpp \
                   2d/CCLabelTTF.cpp \
                   2d/CCLabelTextFormatter.cpp \
                   2d/CCLayer.cpp \
                   2d/CCLight.cpp \
                   2d/CCMotionStreak.cpp \
                   2d/CCNode.cpp \
                   2d/CCNodeGrid.cpp \
                   2d/CCParticleBatchNode.cpp \
                   2d/CCParticleExamples.cpp \
                   2d/CCParticleSystem.cpp \
                   2d/CCParticleSystemQuad.cpp \
                   2d/CCProgressTimer.cpp \
                   2d/CCProtectedNode.cpp \
                   2d/CCRenderTexture.cpp \
                   2d/CCScene.cpp \
                   2d/CCSprite.cpp \
                   2d/CCSpriteBatchNode.cpp \
                   2d/CCSpriteFrame.cpp \
                   2d/CCSpriteFrameCache.cpp \
                   2d/CCTextFieldTTF.cpp \
                   2d/CCTransition.cpp \
                   2d/CCTransitionPageTurn.cpp \
                   2d/CCTransitionProgress.cpp \
                   2d/CCTweenFunction.cpp \
                   platform/CCGLView.cpp \
                   platform/CCFileUtils.cpp \
                   platform/CCSAXParser.cpp \
                   platform/CCThread.cpp \
                   platform/CCImage.cpp \
                   math/CCAffineTransform.cpp \
                   math/CCGeometry.cpp \
                   math/CCVertex.cpp \
                   math/Mat4.cpp \
                   math/MathUtil.cpp \
                   math/Quaternion.cpp \
                   math/TransformUtils.cpp \
                   math/Vec2.cpp \
                   math/Vec3.cpp \
                   math/Vec4.cpp \
                   base/CCAutoreleasePool.cpp \
                   base/CCConfiguration.cpp \
                   base/CCConsole.cpp \
                   base/CCData.cpp \
                   base/CCDataVisitor.cpp \
                   base/CCDirector.cpp \
                   base/CCEvent.cpp \
                   base/CCEventAcceleration.cpp \
                   base/CCEventCustom.cpp \
                   base/CCEventDispatcher.cpp \
                   base/CCEventFocus.cpp \
                   base/CCEventKeyboard.cpp \
                   base/CCEventController.cpp \
                   base/CCEventListener.cpp \
                   base/CCEventListenerController.cpp \
                   base/CCEventListenerAcceleration.cpp \
                   base/CCEventListenerCustom.cpp \
                   base/CCEventListenerFocus.cpp \
                   base/CCEventListenerKeyboard.cpp \
                   base/CCEventListenerMouse.cpp \
                   base/CCEventListenerTouch.cpp \
                   base/CCEventMouse.cpp \
                   base/CCEventTouch.cpp \
                   base/CCIMEDispatcher.cpp \
                   base/CCNS.cpp \
                   base/CCProfiling.cpp \
                   base/ccRandom.cpp \
                   base/CCRef.cpp \
                   base/CCScheduler.cpp \
                   base/CCScriptSupport.cpp \
                   base/CCTouch.cpp \
                   base/CCValue.cpp \
                   base/TGAlib.cpp \
                   base/ZipUtils.cpp \
                   base/atitc.cpp \
                   base/base64.cpp \
                   base/ccCArray.cpp \
                   base/ccFPSImages.c \
                   base/ccTypes.cpp \
                   base/ccUTF8.cpp \
                   base/ccUtils.cpp \
                   base/etc1.cpp \
                   base/pvr.cpp \
                   base/s3tc.cpp \
                   base/CCController.cpp \
                   base/CCController-android.cpp \
                   base/ObjectFactory.cpp \
                   renderer/CCBatchCommand.cpp \
                   renderer/CCCustomCommand.cpp \
                   renderer/CCGLProgram.cpp \
                   renderer/CCGLProgramCache.cpp \
                   renderer/CCGLProgramState.cpp \
                   renderer/CCGLProgramStateCache.cpp \
                   renderer/CCGroupCommand.cpp \
                   renderer/CCQuadCommand.cpp \
                   renderer/CCMeshCommand.cpp \
                   renderer/CCRenderCommand.cpp \
                   renderer/CCRenderer.cpp \
                   renderer/CCTexture2D.cpp \
                   renderer/CCTextureAtlas.cpp \
                   renderer/CCTextureCache.cpp \
                   renderer/ccGLStateCache.cpp \
                   renderer/ccShaders.cpp \
                   renderer/CCVertexIndexBuffer.cpp \
                   renderer/CCVertexIndexData.cpp \
                   renderer/CCPrimitive.cpp \
                   renderer/CCPrimitiveCommand.cpp \
                   renderer/CCTrianglesCommand.cpp \
                   deprecated/CCArray.cpp \
                   deprecated/CCSet.cpp \
                   deprecated/CCString.cpp \
                   deprecated/CCDictionary.cpp \
                   deprecated/CCDeprecated.cpp \
                   deprecated/CCNotificationCenter.cpp \
                   ../external/ConvertUTF/ConvertUTFWrapper.cpp \
                   ../external/ConvertUTF/ConvertUTF.c \
                   ../external/tinyxml2/tinyxml2.cpp \
                   ../external/unzip/ioapi_mem.cpp \
                   ../external/unzip/ioapi.cpp \
                   ../external/unzip/unzip.cpp \
                   ../external/edtaa3func/edtaa3func.cpp \
                   ../external/xxtea/xxtea_file.cpp \
                   ../external/xxhash/xxhash.c

ifeq ($(CC_USE_PHYSICS), 1)
LOCAL_SRC_FILES += physics/CCPhysicsContact.cpp \
                   physics/CCPhysicsJoint.cpp \
                   physics/CCPhysicsShape.cpp \
                   physics/CCPhysicsWorld.cpp \
                   physics/CCPhysicsBody.cpp \
                   physics/chipmunk/CCPhysicsContactInfo_chipmunk.cpp \
                   physics/chipmunk/CCPhysicsJointInfo_chipmunk.cpp \
                   physics/chipmunk/CCPhysicsShapeInfo_chipmunk.cpp \
                   physics/chipmunk/CCPhysicsWorldInfo_chipmunk.cpp \
                   physics/chipmunk/CCPhysicsBodyInfo_chipmunk.cpp
endif

ifeq ($(CC_USE_TMX), 1)
LOCAL_SRC_FILES += 2d/CCFastTMXLayer.cpp \
                   2d/CCFastTMXTiledMap.cpp \
                   2d/CCParallaxNode.cpp \
                   2d/CCTileMapAtlas.cpp \
                   2d/CCTMXLayer.cpp \
                   2d/CCTMXObjectGroup.cpp \
                   2d/CCTMXTiledMap.cpp \
                   2d/CCTMXXMLParser.cpp
endif

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/platform \
                           $(LOCAL_PATH)/base \
                           $(LOCAL_PATH) \
                           $(LOCAL_PATH)/../external/chipmunk/include/chipmunk \
                           $(LOCAL_PATH)/../external/tinyxml2 \
                           $(LOCAL_PATH)/../external/xxhash \
                           $(LOCAL_PATH)/../external/unzip \
                           $(LOCAL_PATH)/../external/nslog \
                           $(LOCAL_PATH)/../external \
                           $(LOCAL_PATH)/..

LOCAL_C_INCLUDES := $(LOCAL_PATH)/platform \
                    $(LOCAL_PATH)/editor-support \
                    $(LOCAL_PATH) \
                    $(LOCAL_PATH)/../external/chipmunk/include/chipmunk \
                    $(LOCAL_PATH)/../external/ConvertUTF \
                    $(LOCAL_PATH)/../external/edtaa3func \
                    $(LOCAL_PATH)/../external/tinyxml2 \
                    $(LOCAL_PATH)/../external/xxhash \
                    $(LOCAL_PATH)/../external/unzip \
                    $(LOCAL_PATH)/../external/nslog \
                    $(LOCAL_PATH)/../external

LOCAL_EXPORT_LDLIBS := -lGLESv2 \
                       -llog \
                       -lz \
                       -landroid

LOCAL_STATIC_LIBRARIES := cocos_freetype2_static
LOCAL_STATIC_LIBRARIES += cocos_png_static
LOCAL_STATIC_LIBRARIES += cocos_jpeg_static

ifeq ($(CC_USE_CCSTUDIO), 1)
LOCAL_STATIC_LIBRARIES += cocostudio_static
endif

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dxandroid_static
LOCAL_WHOLE_STATIC_LIBRARIES += cpufeatures

# define the macro to compile through support/zip_support/ioapi.c
LOCAL_EXPORT_CPPFLAGS := -Wno-deprecated-declarations -Wno-extern-c-compat
LOCAL_EXPORT_CFLAGS := -DUSE_FILE32API
LOCAL_CPPFLAGS := -Wno-deprecated-declarations -Wno-extern-c-compat
LOCAL_CFLAGS := -DUSE_FILE32API

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON  := true
endif

include $(BUILD_STATIC_LIBRARY)

#==============================================================

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dx_static
LOCAL_MODULE_FILENAME := libcocos2d

LOCAL_STATIC_LIBRARIES := cocos_ui_static
LOCAL_STATIC_LIBRARIES += cocosdenshion_static

ifeq ($(CC_USE_WEBSOCKET), 1)
LOCAL_STATIC_LIBRARIES += cocos_network_static
endif
ifeq ($(CC_USE_CCSTUDIO), 1)
LOCAL_STATIC_LIBRARIES += cocostudio_static
endif
ifeq ($(CC_USE_SPINE), 1)
LOCAL_STATIC_LIBRARIES += spine_static
endif
ifeq ($(CC_USE_PHYSICS), 1)
LOCAL_STATIC_LIBRARIES += cocos_chipmunk_static
endif

LOCAL_STATIC_LIBRARIES += cocos2dx_internal_static

include $(BUILD_STATIC_LIBRARY)

#==============================================================

$(call import-module, external/freetype2/prebuilt/android)
$(call import-module, external/png/prebuilt/android)
$(call import-module, external/jpeg/prebuilt/android)
$(call import-module, external/websockets/prebuilt/android)
$(call import-module, external/chipmunk/prebuilt/android)
$(call import-module, external/curl/prebuilt/android)
$(call import-module, cocos/platform/android)
$(call import-module, cocos/audio/android)
$(call import-module, cocos/network)
$(call import-module, cocos/ui)
$(call import-module, cocos/editor-support/cocostudio)
$(call import-module, cocos/editor-support/spine)
$(call import-module, android/cpufeatures)
