package ukraine.gdg.electromicalqueue.api;


import com.squareup.okhttp.ResponseBody;

import java.util.Map;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;
import retrofit2.http.QueryMap;


/**
 * Created by Igor
 * on 16.01.2016
 */
public interface ApiConnection {

    @POST("login")
    Call<ResponseBody> login(@QueryMap Map<String, String> query);

    @POST("register")
    Call<ResponseBody> register(@QueryMap(encoded = true) Map<String, Object> query);

    @GET("personalQueues")
    Call<ResponseBody> queues(@Query("token") String token, @Query("actual") boolean actual);


}
