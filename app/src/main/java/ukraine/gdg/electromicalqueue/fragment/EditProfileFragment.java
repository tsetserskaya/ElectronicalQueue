package ukraine.gdg.electromicalqueue.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import butterknife.Bind;
import butterknife.ButterKnife;
import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.activity.MainActivity;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class EditProfileFragment extends Fragment {

    @Bind(R.id.name)
    EditText name;

    @Bind(R.id.lastName)
    EditText surname;

    @Bind(R.id.coumtry)
    EditText country;

    @Bind(R.id.city)
    EditText city;

    @Bind(R.id.address)
    EditText address;

    @Bind(R.id.phone)
    EditText phone;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_edit_profile, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(getActivity(), view);
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setTitle("Your Profile");
        toolbar.setNavigationIcon(R.drawable.ic_image_navigate_before);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getActivity().getSupportFragmentManager()
                        .popBackStack();
            }
        });
        ((MainActivity) getActivity()).setSupportActionBar(toolbar);
    }
}
