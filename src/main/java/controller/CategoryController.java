package controller;

import model.Category;
import model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.ProductService;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {
    private CategoryService categoryService;
    private ProductService productService;

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }


    @RequestMapping("create")
    private String create(Category category) {
        categoryService.create(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        categoryService.remove(id);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Category category) {
        categoryService.modify(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", categoryService.queryAll());
        return "redirect:/admin/category/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("category", categoryService.queryById(id));
        return "redirect:/admin/category/edit.jsp";
    }

    @RequestMapping("add")
    private String add() {
        session.setAttribute("categories", categoryService.queryList("queryFirstCategories", null));
        return "redirect:/admin/category/add.jsp";
    }
    @RequestMapping("index")
    @ResponseBody
    private List<Category> index(){
        List<Category> categories = categoryService.queryList("queryCategoryTree", null);
        for(Category category:categories){
            int supId = category.getId();
            List<Product> products = productService.queryList("queryIndexProduct", supId);
            category.setProducts(products);
        }
        return categories;
    }
    private List<Product> setProductPath(List<Product> products){
        for(Product product:products) {
            String coverPath = "cover_picture"
                    + "/"
                    + (product.getCategory().getCategoryId())
                    + "/"
                    + (product.getCategoryId())
                    + "/"
                    + (product.getProductId())
                    + "/";
            product.setCoverPath(coverPath);

            String slidePath = "slide_pictures"
                    + "/"
                    + (product.getCategory().getCategoryId())
                    + "/"
                    + (product.getCategoryId())
                    + "/"
                    + (product.getProductId())
                    + "/";
            product.setSlidePath(slidePath);

            String detailPath = "detail_pictures"
                    + "/"
                    + (product.getCategory().getCategoryId())
                    + "/"
                    + (product.getCategoryId())
                    + "/"
                    + (product.getProductId())
                    + "/";
            product.setDetailPath(detailPath);
        }
        return products;
    }
    @RequestMapping("list/{id}")
    @ResponseBody
    private Category list(@PathVariable int id) {
        Category category = new Category();
        category.setCategoryId(id);
        category = categoryService.queryOne("queryCategoryTree", category);
        for (Category subCategory : category.getCategories()) {
            subCategory.setProducts(productService.queryList("queryProductsBySubCategoryId", subCategory.getId()));
        }
        return category;
    }
}
