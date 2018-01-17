package com.mazaiting.ffmpegcmdtest;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    private boolean isRun = false;
    /**视频源路径*/
    private String videoUrl = "/storage/emulated/0/input.mp4";
    /**图片路径*/
    private String imageUrl = "/storage/emulated/0/image.png";
    /**视频输出路径*/
    private String outputUrl = "/storage/emulated/0/output.mp4";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void start(View view){
        if (!isRun) {
            new Thread(mRunnable).start();
            isRun = true;
        } else {
            Toast.makeText(this, "正在运行", Toast.LENGTH_SHORT).show();
        }
    }


    /**
     * 添加水印任务
     */
    Runnable mRunnable = new Runnable() {
        @Override
        public void run() {
            String[] commands = new String[10];
            commands[0] = "ffmpeg";
            commands[1] = "-i";
            commands[2] = videoUrl;
            commands[3] = "-i";
            commands[4] = imageUrl;
            commands[5] = "-filter_complex";
            commands[6] = "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2";
            commands[7] = "-codec:a";
            commands[8] = "copy";
            commands[9] = outputUrl;

            Log.e(TAG, "run: 开始执行");
            int num = FFmpegCmd.execute(commands);
            Log.e(TAG, "run: " + num);
            Log.e(TAG, "run: 执行结束");
        }
    };

}
