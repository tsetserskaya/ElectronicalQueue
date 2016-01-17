package ukraine.gdg.electromicalqueue.utils;

import android.content.Context;

import ukraine.gdg.electromicalqueue.Constants;

/**
 * Created by Igor
 * on 16.01.2016
 */
public class PrefUtils {

    public static void setToken(Context context, String token) {
        context.getApplicationContext().getSharedPreferences(Constants.PREFERENCES, Context.MODE_PRIVATE)
                .edit().putString(Constants.PREFS_TOKEN, token).commit();
    }


    public static String getToken(Context context) {
        return context.getApplicationContext().getSharedPreferences(Constants.PREFERENCES, Context.MODE_PRIVATE)
                .getString(Constants.PREFS_TOKEN, "");
    }

    public static void deleteToken(Context context) {
        context.getApplicationContext().getSharedPreferences(Constants.PREFERENCES, Context.MODE_PRIVATE)
                .edit().remove(Constants.PREFS_TOKEN).commit();
    }

}
