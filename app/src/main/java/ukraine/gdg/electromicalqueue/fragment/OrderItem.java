package ukraine.gdg.electromicalqueue.fragment;

import java.io.Serializable;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class OrderItem implements Serializable {

    public String caption;
    public String doctor;
    public long date;
    public String place;
    public String description;

    public OrderItem(String caption, String doctor, long date, String place, String description) {
        this.caption = caption;
        this.doctor = doctor;
        this.date = date;
        this.place = place;
        this.description = description;
    }
}
