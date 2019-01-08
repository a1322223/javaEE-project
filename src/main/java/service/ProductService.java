package service;

import model.Product;
import org.springframework.web.multipart.MultipartFile;

public interface ProductService extends GenericService<Product,Integer> {
    Product getProductWithPictures(Product product, MultipartFile coverPictures,MultipartFile[] slidePictures,MultipartFile[] detailPictures);
}
