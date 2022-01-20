LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Here is the name of your lib.
# When you change the lib name, change also on System.loadLibrary("") under OnCreate method on StaticActivity.java
# Both must have same name
LOCAL_MODULE    := native

# Code optimization
# -std=c++17 is required to support AIDE app with NDK support
LOCAL_CFLAGS += -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w
LOCAL_CPPFLAGS += -Wno-error=format-security -fvisibility=hidden -ffunction-sections -fdata-sections -w -Werror -s  -fms-extensions
LOCAL_LDFLAGS += -Wl,--gc-sections,--strip-all
LOCAL_ARM_MODE := arm

# Here you add the cpp file

LOCAL_SRC_FILES := main.cpp\
     HOOK/Substrate/hde64.c \
	HOOK/Substrate/SubstrateDebug.cpp \
	HOOK/Substrate/SubstrateHook.cpp \
	HOOK/Substrate/SubstratePosixMemory.cpp \
	HOOK/KittyMemory/KittyMemory.cpp \
	HOOK/KittyMemory/MemoryPatch.cpp \
    HOOK/KittyMemory/MemoryBackup.cpp \
    HOOK/KittyMemory/KittyUtils.cpp \
	HOOK/And64InlineHook/And64InlineHook.cpp

LOCAL_LDLIBS := -llog -landroid
#LOCAL_STATIC_LIBRARIES := android_native_app_glue
include $(BUILD_SHARED_LIBRARY)
