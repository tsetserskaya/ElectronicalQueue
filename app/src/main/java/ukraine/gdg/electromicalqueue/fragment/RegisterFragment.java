package ukraine.gdg.electromicalqueue.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
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
import ukraine.gdg.electromicalqueue.activity.MainActivity;
import ukraine.gdg.electromicalqueue.api.ApiHelper;
import ukraine.gdg.electromicalqueue.utils.PrefUtils;

/**
 * Created by Igor
 * on 16.01.2016
 */
public class RegisterFragment extends Fragment {

    private String TAG = "RegisterFragment";
    private ApiHelper helper = ApiHelper.getInstance();

    @Bind(R.id.name)
    AutoCompleteTextView loginText;

    @Bind(R.id.password)
    EditText passwordText;

    @Bind(R.id.password_conf)
    EditText confText;

    @Bind(R.id.email)
    EditText emailText;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_register, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(getActivity(), view);
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.loginText)
    void returnToLogin() {
        getActivity().getSupportFragmentManager().popBackStack();
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.email_sign_up_button)
    void register() {
        if (checkData()) {
            helper.register(loginText.getText().toString(), passwordText.getText().toString(), emailText.getText().toString(), new Callback<ResponseBody>() {
                @Override
                public void onResponse(Response<ResponseBody> response) {
                    if (response.body() != null) {
                        try {
                            String json = response.body().string();
                            JSONObject obj = new JSONObject(json);
                            if (!obj.optBoolean("isError")) {
                                PrefUtils.setToken(getContext(), obj.optJSONObject("data").optString("token"));
                                Log.d(TAG, obj.optString("registration is successful"));
                                startActivity(new Intent(getContext(), MainActivity.class));
                                getActivity().finish();
                            } else Log.d(TAG, obj.optString("errorMsg"));
                        } catch (IOException | JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }

                @Override
                public void onFailure(Throwable t) {
                    Log.d(TAG, t.getMessage());
                }
            });
        }
    }

    private boolean checkData() {
        if (confText.getText().toString() != passwordText.getText().toString()){
            Toast.makeText(getActivity(), "Passwords are not equal", Toast.LENGTH_SHORT).show();
            return false;
        }
        if (!emailText.getText().toString().contains("@")){
            Toast.makeText(getActivity(), "Email is invalid", Toast.LENGTH_SHORT).show();
            return false;
        }

        return true;
    }
}
