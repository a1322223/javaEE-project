package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.Product;
import model.Record;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.CategoryService;
import service.ProductService;
//import service.RecordService;
import service.RecordService;
import util.Constants;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {
    private ProductService productService;
    private CategoryService categoryService;
    private RecordService recordService;

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setRecordService(RecordService recordService){
        this.recordService = recordService;
    }


    @RequestMapping("create")
    private String create(
            Product product,
            @RequestParam MultipartFile coverPictureFile,
            @RequestParam MultipartFile[] slidePictureFiles,
            @RequestParam MultipartFile[] detailPictureFiles) {
        productService.create(productService.getProductWithPictures(
                product,
                coverPictureFile,
                slidePictureFiles,
                detailPictureFiles));
        return "redirect:/product/queryAll";
    }

   /* @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", productService.queryAll());
        return "redirect:/admin/product/list.jsp";
    }*/

    @RequestMapping("modify")
    private String modify(Product product,
                          @RequestParam MultipartFile coverPictureFile,
                          @RequestParam MultipartFile[] slidePictureFiles,
                          @RequestParam MultipartFile[] detailPictureFiles) {
        //productService.modify(product);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        productService.remove(id);
        return "redirect:/product/queryAllPages";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("product", productService.queryById(id));
        return "redirect:/admin/product/edit.jsp";
    }

    @RequestMapping("add")
    private String add() {
        System.out.println(categoryService.queryList("queryCategoryTree", null).toString());
        session.setAttribute("categories", categoryService.queryList("queryCategoryTree", null));
        return "redirect:/admin/product/add.jsp";
    }

    //    @RequestMapping("detail/{id}")
//    private String detail(@PathVariable int id){
//        session.setAttribute("product", productService.queryById(id));
//        return "redirect:/detail.jsp";
//    }
    @RequestMapping("detail/{id}")
    private String detail(@PathVariable int id) {
        Product p = productService.queryById(id);
        session.setAttribute("product", p);
        session.setAttribute("hotProducts", productService.queryList("queryHotProducts", null));
        User currentUser = (User) session.getAttribute("user");
        if (currentUser != null) {
            Record r = new Record(null,currentUser.getId(),p.getCategoryId(),id,(Long)System.currentTimeMillis());
            recordService.create(r);
        }
        return "redirect:/detail.jsp";
    }

    @RequestMapping("queryAll/{currentPage}")
    private String queryAll(@PathVariable int currentPage) {
        session.setAttribute("pagination", productService.queryAll(currentPage));
        return "redirect:/admin/product/list.jsp";
    }

    @RequestMapping("queryAllPages")
    private String queryAllPages() {
        return queryAll(1);
    }


    //李青松 --- 模糊查询
    @RequestMapping("find")
    private String findByLikeName(@RequestParam String likeName){
        String likeNameAdd = "%"+likeName+"%";
        List<Product> list = productService.queryList("findByLikeName", likeNameAdd);
        int i = 1;
        String notFoundMessage = "";
        while(list.size()==0){
            notFoundMessage = "抱歉，没有查到您要的产品，为您推荐以下产品:";
            likeNameAdd = "%"+likeName.substring(i++)+"%";
            System.out.println(likeName);
            list = productService.queryList("findByLikeName", likeNameAdd);
            if(i>=likeName.length() && list.size()==0){
                notFoundMessage = "抱歉，没有查到您要的信息！";
                break;
            }
        }
        for (Product product: list
                ) {
            product.setDetailPictures(null);
            product.setSlidePictures(null);
            String backImage = Constants.NGINX_HOST+"/cover_picture/"+
                    product.getCategory().getCategoryId()+ "/" +
                    product.getCategoryId()+"/" +
                    product.getProductId() + "/"+
                    product.getCoverPicture();
            product.setCoverPictureUrl(backImage);

        }
        String productList = null;
        ObjectMapper mapper = new ObjectMapper();
        try {
            productList = mapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        session.setAttribute("notFoundMessage", notFoundMessage);
        session.setAttribute("productList", productList);
        return "redirect:/checkPage.jsp";
    }

}
