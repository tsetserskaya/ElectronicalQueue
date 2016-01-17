package ukraine.gdg.electromicalqueue.fragment;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ukraine.gdg.electromicalqueue.R;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class OrdersAdapter extends ArrayAdapter<OrderItem>{

    private List<OrderItem> mList;

    public OrdersAdapter(ArrayList<OrderItem> list, int resourceId, Context context) {
        super(context, resourceId, list);
        mList = list;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (mList != null) {

            ViewHolder vh = new ViewHolder();
            final OrderItem item = getItem(position);
            View v = convertView;
            if (v == null) {
                v = LayoutInflater.from(getContext()).inflate(R.layout.item_order, parent, false);
                vh.doctor = (TextView) v.findViewById(R.id.doctorText);
                vh.caption = (TextView) v.findViewById(R.id.captionText);
                vh.place = (TextView) v.findViewById(R.id.placeText);
                vh.time = (TextView) v.findViewById(R.id.timeText);
                vh.date = (TextView) v.findViewById(R.id.dateText);
                v.setTag(vh);
            }
            vh = (ViewHolder) v.getTag();
            vh.doctor.setText(item.doctor);
            vh.caption.setText(item.caption);
            vh.place.setText(item.place);
            vh.time.setText(getReadableTimeString(item.time));
            vh.date.setText(getReadableDateString(item.date));
            return v;
        } else return null;
    }



    public void setList(List<OrderItem> list) {
        mList = list;
        notifyDataSetChanged();
    }

    @Override
    public int getPosition(OrderItem item) {
        return mList.indexOf(item);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public OrderItem getItem(int position) {
        return mList.get(position);
    }

    @Override
    public int getCount() {
        if (mList != null) {
            return mList.size();
        } else return 0;
    }


    static class ViewHolder {
        TextView doctor;
        TextView time;
        TextView date;
        TextView caption;
        TextView place;
    }

    public static String getReadableDateString(long dateTime) {
        Date date = new Date(dateTime * 1000);
        SimpleDateFormat format = new SimpleDateFormat("MMM, dd");
        return format.format(date);
    }

    public static String getReadableTimeString(long time) {
        Date date = new Date(time * 1000);
        SimpleDateFormat format = new SimpleDateFormat("hh:mm a");
        return format.format(date);
    }


}
