package poly.dto;

public class UserDTO {
    private String user_seq;
    private String user_id;
    private String user_name;
    private String user_nic;
    private String user_password;
    private String email;
    private String like_branch;
    private String user_addr;
    private String user_addr2;
    private String exists_yn;

    public String getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(String user_seq) {
        this.user_seq = user_seq;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_nic() {
        return user_nic;
    }

    public void setUser_nic(String user_nic) {
        this.user_nic = user_nic;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLike_branch() {
        return like_branch;
    }

    public void setLike_branch(String like_branch) {
        this.like_branch = like_branch;
    }

    public String getUser_addr() {
        return user_addr;
    }

    public void setUser_addr(String user_addr) {
        this.user_addr = user_addr;
    }

    public String getUser_addr2() {
        return user_addr2;
    }

    public void setUser_addr2(String user_addr2) {
        this.user_addr2 = user_addr2;
    }

    public String getExists_yn() {
        return exists_yn;
    }

    public void setExists_yn(String exists_yn) {
        this.exists_yn = exists_yn;
    }
}
