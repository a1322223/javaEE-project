package service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.GenericDao;
import model.Product;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import service.ProductService;
import util.Constants;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Integer> implements ProductService {
    private HttpServletRequest request;
    private ServletContext application;

    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    @Autowired
    void setGenericDao(GenericDao<Product, Integer> genericDao) {
        super.genericDao = genericDao;
    }

    @Override
    public Product getProductWithPictures(Product product, MultipartFile coverPicture, MultipartFile[] slidePictures, MultipartFile[] detailPictures) {
        String coverPictureString = getPictureName(new MultipartFile[]{coverPicture}, "cover");
        String slidePicturesString = getPictureName(slidePictures, "slide");
        String detailPicturesString = getPictureName(detailPictures, "detail");

        product.setCoverPicture(coverPictureString);
        product.setSlidePictures(slidePicturesString);
        product.setDetailPictures(detailPicturesString);

        return product;
    }

    private String saveFile(MultipartFile[] multipartFiles, String filePath) {
        String[] fileNames = new String[multipartFiles.length];
        for (int i = 0; i < multipartFiles.length; i++) {
            String fileName = System.nanoTime() + "." + FilenameUtils.getExtension(multipartFiles[i].getOriginalFilename());
            try {
                multipartFiles[i].transferTo(new File(filePath, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            fileNames[i] = fileName;
        }
        return convertToJsonArray(fileNames);
    }


    private String convertToJsonArray(String[] strings) {
        ObjectMapper mapper = new ObjectMapper();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            mapper.writeValue(byteArrayOutputStream, strings);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] bytes = byteArrayOutputStream.toByteArray();
        return new String(bytes);
    }
    private String getPictureName(MultipartFile[] multipartFiles, String type) {
        application = request.getServletContext();
        String filePath;
        switch (type) {
            case "cover":
                filePath = application.getRealPath(Constants.COVER_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            case "slide":
                filePath = application.getRealPath(Constants.SLIDE_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            case "detail":
                filePath = application.getRealPath(Constants.DETAIL_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            default:
                return null;
        }
    }


    @Override
    public Object query(String sqlId, Object parameter) {
        return genericDao.query(sqlId, parameter);
    }
}