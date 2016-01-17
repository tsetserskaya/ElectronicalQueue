package ukraine.gdg.electromicalqueue.fragment;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class OrderItem {

    public String caption;
    public String doctor;
    public long time;
    public long date;
    public String place;

    public OrderItem(String caption, String doctor, long time, long date, String place) {
        this.caption = caption;
        this.doctor = doctor;
        this.time = time;
        this.date = date;
        this.place = place;
    }
}
