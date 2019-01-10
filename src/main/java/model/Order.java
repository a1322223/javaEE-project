package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Serializable {
    private Integer id;
    private List<OrderProduct> orderProducts;
    private String createTime;
    private String finishTime;
    private double totalPrice;
    private Integer status;
    private Integer addressId;
    private Integer userId;
}
