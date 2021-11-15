package poly.dto;

public class OrderDTO {
    private String order_seq;
    private String clothes_cnt;
    private String clothes_contents;
    private String order_status;
    private String order_dt;
    private String user_seq;
    private String bns_seq;

    public String getOrder_seq() {
        return order_seq;
    }

    public void setOrder_seq(String order_seq) {
        this.order_seq = order_seq;
    }

    public String getClothes_cnt() {
        return clothes_cnt;
    }

    public void setClothes_cnt(String clothes_cnt) {
        this.clothes_cnt = clothes_cnt;
    }

    public String getClothes_contents() {
        return clothes_contents;
    }

    public void setClothes_contents(String clothes_contents) {
        this.clothes_contents = clothes_contents;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public String getOrder_dt() {
        return order_dt;
    }

    public void setOrder_dt(String order_dt) {
        this.order_dt = order_dt;
    }

    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getBns_seq() {
        return bns_seq;
    }

    public void setBns_seq(String bns_seq) {
        this.bns_seq = bns_seq;
    }
}
