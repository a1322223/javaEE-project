package model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable {
    private Integer id;
    private String province;
    private String city;
    private String area;
    private String town;
    private String detail;
    private String name;
    private String mobile;
    private int status;
    private Integer userId;
}
