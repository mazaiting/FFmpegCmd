package com.mazaiting.ffmpegcmdtest;

/**
 * FFmpeg命令行操作
 * @author mazaiting
 * @date 2018/1/12
 */

public class FFmpegCmd {

    static {
        System.loadLibrary("avcodec-57");
        System.loadLibrary("avdevice-57");
        System.loadLibrary("avfilter-6");
        System.loadLibrary("avformat-57");
        System.loadLibrary("avutil-55");
        System.loadLibrary("swresample-2");
        System.loadLibrary("swscale-4");
        System.loadLibrary("FfmpegCmd");
    }

    public static int execute(String[] commands) {
        return run(commands);
    }

    public native static int run(String[] commands);
}
