package ukraine.gdg.electromicalqueue.api;

import android.content.Context;
import android.util.Log;

import com.squareup.okhttp.ResponseBody;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import retrofit2.Callback;
import retrofit2.Retrofit;
import ukraine.gdg.electromicalqueue.Constants;
import ukraine.gdg.electromicalqueue.utils.PrefUtils;

/**
 * Created by Igor
 * on 16.01.2016
 */
public class ApiHelper {

    private static final String TAG = "ApiHelper";
    private static volatile ApiHelper instance;
    private ApiConnection connection = new Retrofit.Builder()
            .baseUrl(Constants.BASE_API_URL)
            .build()
            .create(ApiConnection.class);


    public static ApiHelper getInstance() {
        ApiHelper localInstance = instance;
        if (localInstance == null) {
            synchronized (ApiHelper.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new ApiHelper();
                }
            }
        }
        return localInstance;
    }


    private ApiHelper() {
    }

    public void login(String login, String password, Callback<ResponseBody> callback) {
        Map<String, String> query = new HashMap<>();
        query.put("login", login);
        query.put("password", password);
        connection.login(query).enqueue(callback);
    }

    public void register(String login, String password, String email, Callback<ResponseBody> callback) {
        Map<String, Object> query = new HashMap<>();
        query.put("login", login);
        query.put("password", password);
        query.put("email", email);
        connection.register(query).enqueue(callback);
    }

    public void personalQueues(Context context, boolean actual, Callback<ResponseBody> callback) {
        connection.queues(PrefUtils.getToken(context), actual).enqueue(callback);
    }

}
