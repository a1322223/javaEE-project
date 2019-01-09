package model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Record implements Serializable {
    private Integer id;
    private Integer userId;
    private Integer categoryId;
    private Integer productId;
    private Long recordTime;
}