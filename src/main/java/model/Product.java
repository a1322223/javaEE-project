package model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
    private Integer id;
    private Integer productId;
    private String title;
    private String desc;
    private String coverPicture;
    private String slidePictures;
    private String detailPictures;
    private double price;
    private double originPrice;
    private String createTime;
    private String updateTime;
    private int stock;
    private int status;
    private String mp4;
    private String webm;
    private Integer categoryId;
    private String coverPictureUrl;

    private Cart cart;
    private Category category;

    private String coverPath;
    private String slidePath;
    private String detailPath;
}
