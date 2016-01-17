package ukraine.gdg.electromicalqueue.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import butterknife.Bind;
import butterknife.ButterKnife;
import ukraine.gdg.electromicalqueue.R;
import ukraine.gdg.electromicalqueue.activity.MainActivity;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class OrderDetailsFragment extends Fragment {

    private OrderItem item;

    @Bind(R.id.caption)
    TextView caption;

    @Bind(R.id.date)
    TextView date;

    @Bind(R.id.time)
    TextView time;

    @Bind(R.id.doctor)
    TextView doctor;

    @Bind(R.id.description)
    TextView description;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_order_details, container, false);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(getActivity(), view);
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        toolbar.setTitle("Your Queue");
        toolbar.setNavigationIcon(R.drawable.ic_image_navigate_before);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getActivity().getSupportFragmentManager()
                        .popBackStack();
            }
        });
        item = (OrderItem) getArguments().getSerializable("data");
        ((MainActivity) getActivity()).setSupportActionBar(toolbar);
        caption.setText(item.caption);
        date.setText(OrdersAdapter.getReadableDateString(item.date));
        time.setText(OrdersAdapter.getReadableTimeString(item.date));
        doctor.setText(item.doctor);
        description.setText(item.description);
    }
}
