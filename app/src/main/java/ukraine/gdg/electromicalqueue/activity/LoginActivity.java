package ukraine.gdg.electromicalqueue.activity;


import android.os.Bundle;

import ukraine.gdg.electromicalqueue.fragment.LoginFragment;
import ukraine.gdg.electromicalqueue.R;

/**
 * A login screen that offers login via login/password.
 */
public class LoginActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        getSupportFragmentManager().beginTransaction()
                .replace(R.id.login_container, new LoginFragment())
                .commit();
    }
}

