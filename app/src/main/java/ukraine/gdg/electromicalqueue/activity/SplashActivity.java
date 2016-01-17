package ukraine.gdg.electromicalqueue.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

import ukraine.gdg.electromicalqueue.R;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class SplashActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        startActivity(new Intent(SplashActivity.this, LoginActivity.class));
                    }
                });
            }
        }, 4000);
    }
}
