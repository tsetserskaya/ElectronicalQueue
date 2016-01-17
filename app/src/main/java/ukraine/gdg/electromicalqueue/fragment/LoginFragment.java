package ukraine.gdg.electromicalqueue.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Toast;

import com.squareup.okhttp.ResponseBody;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import retrofit2.Callback;
import retrofit2.Response;
import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.api.ApiHelper;
import ukraine.gdg.electromicalqueue.utils.PrefUtils;

/**
 * Created by Igor
 * on 16.01.2016
 */
public class LoginFragment extends Fragment {

    private String TAG = "LoginFragment";
    private ApiHelper helper = ApiHelper.getInstance();

    @Bind(R.id.login)
    AutoCompleteTextView loginText;

    @Bind(R.id.password)
    EditText passwordText;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        return inflater.inflate(R.layout.fragment_login, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(this, view);
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.email_sign_in_button)
    void provideLogin() {

        if (TextUtils.isEmpty(loginText.getText().toString())) {
            Toast.makeText(getActivity(), "Please, write your login", Toast.LENGTH_LONG).show();
            Log.d(TAG, "login is empty");
            return;
        }
        if (TextUtils.isEmpty(passwordText.getText().toString())) {
            Toast.makeText(getActivity(), "Please, write your password", Toast.LENGTH_LONG).show();
            Log.d(TAG, "password is empty");
            return;
        }

        helper.login(loginText.getText().toString(), passwordText.getText().toString(), new Callback<ResponseBody>() {
            @Override
            public void onResponse(Response<ResponseBody> response) {
                if (response.body() != null) {
                    try {
                        String json = response.body().string();
                        JSONObject object = new JSONObject(json);
                        if (!object.optBoolean("isError")) {
                            Log.d(TAG, "login is successful");
                            PrefUtils.setToken(getActivity(), object.optJSONObject("data").optString("token"));
                        } else {
                            if (object.optString("errorMsg") == "Password is incorrect") {
                                Toast.makeText(getActivity(), "Password is incorrect", Toast.LENGTH_LONG).show();
                            }
                        }
                    } catch (IOException | JSONException e) {
                        e.printStackTrace();
                    }
                } else Log.d(TAG, "response body is null");
            }

            @Override
            public void onFailure(Throwable t) {
                Log.d(TAG, t.getMessage());
            }
        });
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.registerText)
    void lolka() {
        RegisterFragment fragment = new RegisterFragment();
        getActivity().getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.login_container, fragment)
                .addToBackStack(null)
                .commit();

    }
}
