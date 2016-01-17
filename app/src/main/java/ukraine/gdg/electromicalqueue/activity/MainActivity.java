package ukraine.gdg.electromicalqueue.activity;

import android.os.Bundle;

import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.fragment.HomeFragment;

/**
 * Created by Igor
 * on 16.01.2016
 */
public class MainActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportFragmentManager().beginTransaction()
                .replace(R.id.home_container, new HomeFragment())
                .commit();
    }
}
