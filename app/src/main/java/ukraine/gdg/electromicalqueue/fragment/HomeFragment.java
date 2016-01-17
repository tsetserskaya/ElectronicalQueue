                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  package ukraine.gdg.electromicalqueue.fragment;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import com.squareup.okhttp.ResponseBody;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import retrofit2.Callback;
import retrofit2.Response;
import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.activity.LoginActivity;
import ukraine.gdg.electromicalqueue.activity.MainActivity;
import ukraine.gdg.electromicalqueue.api.ApiHelper;
import ukraine.gdg.electromicalqueue.utils.PrefUtils;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class HomeFragment extends Fragment {

    private static final String TAG = "HomeFragment";
    private ArrayList<OrderItem> list;
    private ApiHelper helper = ApiHelper.getInstance();

    @Bind(R.id.listView)
    private ListView lv;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_home, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(getActivity(), view);
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setTitle("FastQueue");
        toolbar.inflateMenu(R.menu.menu_home);
        toolbar.setOnMenuItemClickListener(new Toolbar.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.doctor:

                        break;
                    case R.id.old:

                        break;
                    case R.id.logout:
                        PrefUtils.deleteToken(getActivity());
                        startActivity(new Intent(getActivity(), LoginActivity.class));
                        getActivity().finish();
                        break;

                }
                return true;
            }
        });
        ((MainActivity) getActivity()).setSupportActionBar(toolbar);
        helper.personalQueues(getContext(), true, new Callback<ResponseBody>() {
            @Override
            public void onResponse(Response<ResponseBody> response) {
                if (response.body() != null){
                    try {
                        String json = response.body().string();
                        JSONObject object = new JSONObject(json);
                        if (!object.optBoolean("isError")){
                            list = new ArrayList<>();
                            JSONObject obj = object.optJSONObject("data");
                            JSONArray queues = obj.optJSONArray("values");
                            for (int C = 0; C < queues.length() ; C++){
                                JSONObject o = queues.getJSONObject(C);
                                list.add(new OrderItem(o.optString("organisation"), o.optString("doctor"), o.optLong("date"), o.optString("place"), o.optString("description")));
                            }
                            ((OrdersAdapter)lv.getAdapter()).setList(list);
                        }
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
        OrdersAdapter adapter = new OrdersAdapter(null, R.id.listView, getContext());
//        list = new ArrayList<>();
//        list.add(new OrderItem("Hospital", "murzzik", 141854414, "Cherkassy, 156 Hoholya str.", "oeirhgjioergjnrelktrhgnewirlkfewf"));
//        list.add(new OrderItem("Hospital", "murzik", 141854514, "Cherkassy, 156 Hoholya str.", "oeirhgjioergjnrel4tkgnewirlkfewf"));
//        list.add(new OrderItem("Hospital", "murzikz", 141853454, "Cherkassy, 156 Hoholya str.", "oeirhgjioergjnrelk26ggnewirlkfewf"));
//        list.add(new OrderItem("Hospital", "murzzik", 141852414, "Cherkassy, 156 Hoholya str.", "oeirhgjioergjnrelfsfregkgnewirlkfewf"));
//        list.add(new OrderItem("Hospital", "muzrzik", 141851414, "Cherkassy, 156 Hoholya str.", "oeirhgjioergjnrelk235gnewirlkfewf"));
        lv.setAdapter(adapter);
        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                OrderDetailsFragment fragment = new OrderDetailsFragment();
                Bundle data = new Bundle(1);
                data.putSerializable("data", ((OrdersAdapter) lv.getAdapter()).getItem(position));
                fragment.setArguments(data);
                getActivity().getSupportFragmentManager()
                        .beginTransaction()
                        .replace(R.id.home_container, fragment)
                        .addToBackStack(null)
                        .commit();
            }
        });
        lv.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
                showDialog(position);
                return true;
            }
        });
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.imageViewEdit)
    void editData() {
        getActivity().getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.home_container, new EditProfileFragment())
                .addToBackStack(null)
                .commit();
    }

    @SuppressWarnings("unused")
    @OnClick(R.id.queueUpButton)
    void queueUp() {
        getActivity().getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.home_container, new QueueUpFragment())
                .addToBackStack(null)
                .commit();
    }

    private void showDialog(final int position){
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
                ((OrdersAdapter) lv.getAdapter()).remove(((OrdersAdapter)lv.getAdapter()).getItem(position));
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.dismiss();
            }
        }).setMessage("Are you sure to remove this queue?").show();
    }
}
