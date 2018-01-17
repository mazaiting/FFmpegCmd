LOCAL_PATH := $(call my-dir)

# FFmpeg library
include $(CLEAR_VARS)
# 打印当前路径
$(warning $(LOCAL_PATH))
# .so文件名称，去除前缀lib和-后的内容
LOCAL_MODULE := avcodec
# .so文件
LOCAL_SRC_FILES := libavcodec-57.so
# 已编译好的库使用PREBUILT_SHARED_LIBRARY
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := avdevice
LOCAL_SRC_FILES := libavdevice-57.so
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := avfilter
LOCAL_SRC_FILES := libavfilter-6.so
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := avformat
LOCAL_SRC_FILES := libavformat-57.so
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := avutil
LOCAL_SRC_FILES := libavutil-55.so
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := swresample
LOCAL_SRC_FILES := libswresample-2.so
include $(PREBUILT_SHARED_LIBRARY)

# FFmpeg library
include $(CLEAR_VARS)
LOCAL_MODULE := swscale
LOCAL_SRC_FILES := libswscale-4.so
include $(PREBUILT_SHARED_LIBRARY)

# Program
# module名称
include $(CLEAR_VARS)
LOCAL_MODULE := FfmpegCmd
# module中的源文件
LOCAL_SRC_FILES := com_mazaiting_ffmpegcmdtest_FFmpegCmd.c ffmpeg.c ffmpeg_opt.c cmdutils.c ffmpeg_filter.c
# ffmpeg源码路径
LOCAL_C_INCLUDES += C:/Users/Administrator/Desktop/ffmpeg-3.3.6
LOCAL_LDLIBS := -llog -lz
# 链接的动态库文件
LOCAL_SHARED_LIBRARIES := avcodec avdevice avfilter avformat avutil swresample swscale
# 编译生成的库使用BUILD_SHARED_LIBRARY
include $(BUILD_SHARED_LIBRARY)