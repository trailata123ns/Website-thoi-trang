package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Dto.Contact;
import com.haui.shopthoitranghades.Dto.ProductSearch;
import com.haui.shopthoitranghades.Dto.Review;
import com.haui.shopthoitranghades.Entity.*;
import com.haui.shopthoitranghades.Service.CategoryService;
import com.haui.shopthoitranghades.Service.ProductService;
import com.haui.shopthoitranghades.Service.ReviewService;
import com.haui.shopthoitranghades.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class ShopController extends BaseController{

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    UserService userService;

    public static int SIZE_OF_PAGE = 9;

    @RequestMapping(value = "shop" , method = RequestMethod.GET)
    public String shopProduct(Model model ,
                              final HttpServletRequest request,
                              @RequestParam("p") Optional<Integer> p,
                              @RequestParam(defaultValue = "0") int orderBy,
                              Integer page){

        Pageable pageCategory = PageRequest.of(p.orElse(0),6);
        Page<CategoryEntity> listCategory = categoryService.findAll(pageCategory);
        model.addAttribute("categories",listCategory);

        //	int page = getCurrentPage(request);
        if(page == null)
        {
            page=1;
        }

        String keyword = request.getParameter("keyword");
        ProductSearch ps = new ProductSearch();
        ps.setKeyword(keyword);
        if(orderBy > 0){
            ps.setOrderBy(orderBy);
        }
        ps.setPage(page-1);

        //Lấy full bản ghi không theo key
        long list = productService.count();

        //Lấy tổng số bản ghi
        int listCount = (int) list;

        //Số trang
        int totalPage=(Integer)listCount/SIZE_OF_PAGE +(listCount % SIZE_OF_PAGE == 0?0:1);

        List<Integer> listPage=new ArrayList<Integer>();
        for(int i=1;i<=totalPage;i++)
        {
            listPage.add(i);
        }

        model.addAttribute("od", orderBy);
        model.addAttribute("listPage",listPage);

        model.addAttribute("listProduct", productService.search(ps));
        return "user/shop";
    }

    @RequestMapping(value = "productDetail/{id}",method = RequestMethod.GET)
    public String productDetail(
            final  Model model,
            @PathVariable Integer id,
            Integer page
    ){

        if(page == null)
        {
            page=1;
        }

        ProductSearch productSearch = new ProductSearch();

        productSearch.setPage(page-1);

        long list = productService.count();

        int listCount = (int) list;

        int totalPage=(Integer)listCount/SIZE_OF_PAGE +(listCount % SIZE_OF_PAGE == 0?0:1);

        List<Integer> listPage=new ArrayList<Integer>();
        for(int i=1;i<=totalPage;i++)
        {
            listPage.add(i);
        }
        ProductsEntity productsEntity = productService.findById(id).get();

        model.addAttribute("productImgList",productsEntity.getProductsImages());

        productSearch.setCategory_id(productsEntity.getCategories().getId());

        model.addAttribute("listPage",listPage);

        model.addAttribute("productList",productService.listProductByCategory(productSearch));

        model.addAttribute("productDetail",productService.findById(id).get());

        List<ReviewEntity> list1 = (List<ReviewEntity>) reviewService.findByProduct(productService.findById(id).get());
        for(int i = 0 ; i < list1.size();i++){
            if(!list1.get(i).getUser().getStatus()){
                list1.remove(i);
            }
        }

//        model.addAttribute("reivewList",reviewService.findByProduct(productService.findById(id).get()));
        model.addAttribute("reivewList",list1);

        return "user/shop-detail";
    }


    @RequestMapping(value = "shop/{id}",method = RequestMethod.GET)
    public String getListProductByCategoryId(
            final  Model model,
            @PathVariable Integer id,
            @RequestParam("p") Optional<Integer> p,
            Integer page
    ){
        Pageable pageCategory = PageRequest.of(p.orElse(0),6);
        Page<CategoryEntity> listCategory = categoryService.findAll(pageCategory);
        model.addAttribute("categories",listCategory);

        //	int page = getCurrentPage(request);
        if(page == null)
        {
            page=1;
        }

        ProductSearch productSearch = new ProductSearch();

        productSearch.setPage(page-1);

        //Lấy full bản ghi không theo key
        long list = productService.count();

        //Lấy tổng số bản ghi
        int listCount = (int) list;

        //Số trang
        int totalPage=(Integer)listCount/SIZE_OF_PAGE +(listCount % SIZE_OF_PAGE == 0?0:1);

        List<Integer> listPage=new ArrayList<Integer>();
        for(int i=1;i<=totalPage;i++)
        {
            listPage.add(i);
        }

        productSearch.setCategory_id(id);

        model.addAttribute("listPage",listPage);

        model.addAttribute("listProduct",productService.listProductByCategory(productSearch));

        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.getProducts().size();

        return "user/shop";
    }

    @RequestMapping(value = { "/reviewUser" }, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> reivewUser(final Model model ,
                                                           final HttpServletRequest request,
                                                           final HttpServletResponse response,
                                                           final @RequestBody Review review) throws ParseException {

        Map<String, Object> jsonResult = new HashMap<String, Object>();

        ReviewEntity reviewEntity = new ReviewEntity();

        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatted = current.format(formatter);
        Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatted);

        if(isLogined()){
            reviewEntity.setContent(review.getContent());
            reviewEntity.setProduct(productService.findById(review.getProductId()).get());
            reviewEntity.setUser(userService.getById(getUserLogined().getId()));
            reviewEntity.setCreatedDate(date);
        }

        reviewService.save(reviewEntity);

        jsonResult.put("code", 200);
        return ResponseEntity.ok(jsonResult);
    }

    Boolean isBoughtProduct(int productId , int saleOrderProductId , int userId){

        return true;
    }


}
