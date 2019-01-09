package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderProduct implements Serializable {
    private Integer id;
    private Integer productId;
    private Integer number;
}
