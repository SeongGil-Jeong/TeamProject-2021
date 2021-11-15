package poly.dto;

public class ClothesDTO {
    private String clothes_seq;
    private String clothes_name;
    private String clothes_type;
    private String clothes_info;
    private String user_seq;
    private String order_seq;

    public String getClothes_seq() {
        return clothes_seq;
    }

    public void setClothes_seq(String clothes_seq) {
        this.clothes_seq = clothes_seq;
    }

    public String getClothes_name() {
        return clothes_name;
    }

    public void setClothes_name(String clothes_name) {
        this.clothes_name = clothes_name;
    }

    public String getClothes_type() {
        return clothes_type;
    }

    public void setClothes_type(String clothes_type) {
        this.clothes_type = clothes_type;
    }

    public String getClothes_info() {
        return clothes_info;
    }

    public void setClothes_info(String clothes_info) {
        this.clothes_info = clothes_info;
    }

    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getOrder_seq() {
        return order_seq;
    }

    public void setOrder_seq(String order_seq) {
        this.order_seq = order_seq;
    }
}
