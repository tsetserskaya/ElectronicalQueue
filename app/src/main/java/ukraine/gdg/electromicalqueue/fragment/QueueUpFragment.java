package ukraine.gdg.electromicalqueue.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import butterknife.ButterKnife;
import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.activity.MainActivity;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class QueueUpFragment extends Fragment {

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_queue_up, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(getActivity(), view);
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setTitle("Queue Up");
        toolbar.inflateMenu(R.menu.menu_queue_up);
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
