package model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category implements Serializable {
    private Integer id;
    private String title;
    private String group;
    private String icon;
    private String desc;
    private String createTime;
    private String updateTime;
    private int status;
    private int categoryId;
    private List<Category> categories;
    private List<Product> products;
}
