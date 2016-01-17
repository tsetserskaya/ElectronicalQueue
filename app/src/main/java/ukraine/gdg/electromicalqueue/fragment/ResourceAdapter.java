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
public class ResourceAdapter extends ArrayAdapter<ResourceItem> {

    private List<ResourceItem> mList;

    public ResourceAdapter(ArrayList<ResourceItem> list, int resourceId, Context context) {
        super(context, resourceId, list);
        mList = list;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (mList != null) {

            ViewHolder vh = new ViewHolder();
            final ResourceItem item = getItem(position);
            View v = convertView;
            if (v == null) {
                v = LayoutInflater.from(getContext()).inflate(R.layout.item_resource, parent, false);
                vh.specialization = (TextView) v.findViewById(R.id.specialization);
                vh.name = (TextView) v.findViewById(R.id.name);
                vh.place = (TextView) v.findViewById(R.id.place);
                vh.time = (TextView) v.findViewById(R.id.time);
                vh.organisation = (TextView) v.findViewById(R.id.organisation);
                v.setTag(vh);
            }
            vh = (ViewHolder) v.getTag();
            vh.specialization.setText(item.specialization);
            vh.name.setText(item.name);
            vh.place.setText(item.address);
            vh.time.setText((getReadableTimeString(item.timeStart) + " - " + getReadableTimeString(item.timeEnd)));
            vh.organisation.setText(item.organisation);
            return v;
        } else return null;
    }



    public void setList(List<ResourceItem> list) {
        mList = list;
        notifyDataSetChanged();
    }

    @Override
    public int getPosition(ResourceItem item) {
        return mList.indexOf(item);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public ResourceItem getItem(int position) {
        return mList.get(position);
    }

    @Override
    public void remove(ResourceItem object) {
        mList.remove(object);
        notifyDataSetChanged();
    }

    @Override
    public int getCount() {
        if (mList != null) {
            return mList.size();
        } else return 0;
    }


    static class ViewHolder {
        TextView name;
        TextView organisation;
        TextView time;
        TextView specialization;
        TextView place;
    }

    public static String getReadableTimeString(long time) {
        Date date = new Date(time * 1000);
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        return format.format(date);
    }

}
