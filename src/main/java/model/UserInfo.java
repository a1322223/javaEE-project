package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfo implements Serializable {
    private Integer id;
    private String username;
    private String avatar;
    private String mobile;
    private String createTime;
    private  String updateTime;
    private  String updateIp;
    private String token;
    private long tokenTime;
    private int userId;

    public UserInfo(String createTime, int userId) {
        this.createTime = createTime;
        this.userId = userId;
    }

}
