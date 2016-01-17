package ukraine.gdg.electromicalqueue.fragment;

/**
 * Created by Igor
 * on 17.01.2016
 */
public class ResourceItem {

    public String name;
    public String organisation;
    public long timeStart;
    public long timeEnd;
    public String specialization;
    public String address;

    public ResourceItem (String name, String organisation, long timeStart, long timeEnd, String specialization, String address) {
        this.name = name;
        this.organisation = organisation;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.specialization = specialization;
        this.address = address;
    }
}
