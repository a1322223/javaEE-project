package model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart implements Serializable {
    private Integer id;
    private Integer productId;
    private int number;
    private String createTime;
    private String updateTime;
    private Integer userId;
}