#include "com_mazaiting_ffmpegcmdtest_FFmpegCmd.h"
#include "ffmpeg.h"
#include <android/log.h>

#define LOGI(FORMAT, ...) __android_log_print(ANDROID_LOG_INFO,"ffmpeg",FORMAT,##__VA_ARGS__);
#define LOGE(FORMAT, ...) __android_log_print(ANDROID_LOG_ERROR,"ffmpeg",FORMAT,##__VA_ARGS__);

JNIEXPORT jint JNICALL Java_com_mazaiting_ffmpegcmdtest_FFmpegCmd_run
  (JNIEnv *env, jclass cls, jobjectArray commands) {

      int argc = (*env)->GetArrayLength(env, commands);
      char *argv[argc];

      LOGE("Kit argc %d\n", argc);
      int i;
      for (i = 0; i < argc; i++) {
          jstring js = (jstring)(*env)->GetObjectArrayElement(env, commands, i);
          argv[i] = (char *) (*env)->GetStringUTFChars(env, js, 0);
          LOGE("Kit argv %s\n", argv[i]);
      }

      return run(argc, argv);
  }