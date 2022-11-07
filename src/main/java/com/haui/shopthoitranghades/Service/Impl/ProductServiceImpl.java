package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Dto.ProductSearch;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ProductsImagesEntity;
import com.haui.shopthoitranghades.Responsitory.ProductResponsitory;
import com.haui.shopthoitranghades.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.util.List;
import java.util.Optional;

import static com.haui.shopthoitranghades.Dto.Constants.UPLOAD_FILE_ROOT;

@Service
public class ProductServiceImpl extends BaseService<ProductsEntity> implements ProductService{
    @Autowired(required=false)
    ProductResponsitory productResponsitory;

    @Override
    public List<ProductsEntity> findAll(Sort sort) {
        return (List<ProductsEntity>)productResponsitory.findAll(sort);
    }

    @Override
    public Page<ProductsEntity> findAll(Pageable pageable) {
        return productResponsitory.findAll(pageable);
    }

    @Override
    public ProductsEntity  save(ProductsEntity entity) {
        return productResponsitory.save(entity);
    }

    @Override
    public List<ProductsEntity> saveAll(List<ProductsEntity> entities) {
        return (List<ProductsEntity>)productResponsitory.saveAll(entities);
    }

    @Override
    public List<ProductsEntity> findTop8NewProduct() throws Exception {
        return productResponsitory.findTop8ByOrderByCreatedDateDesc();
    }

    @Override
    public List<ProductsEntity> findTop8ProductHot() throws Exception {
        return productResponsitory.findTop8ByIsHot(true);
    }

    @Override
    public List<ProductsEntity> findByStatus(Boolean status) throws Exception {
        if (status == null) {
            return (List<ProductsEntity>) productResponsitory.findAll();
        }
        return productResponsitory.findByStatus(status);
    }


    @Override
    public Optional<ProductsEntity> findById(Integer integer) {
        return productResponsitory.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return productResponsitory.existsById(integer);
    }

    @Override
    protected Class<ProductsEntity> clazz() {
        // TODO Auto-generated method stub
        return ProductsEntity.class;
    }

    @Override
    public List<ProductsEntity> findAll() {
        return (List<ProductsEntity>)productResponsitory.findAll();
    }

    @Override
    public List<ProductsEntity> findAllById(List<Integer> integers) {
        return (List<ProductsEntity>)productResponsitory.findAllById(integers);
    }

    @Override
    public long count() {
        return productResponsitory.count();
    }

    @Override
    public void deleteById(Integer integer) {
        productResponsitory.deleteById(integer);
    }

    @Override
    public void delete(Optional<ProductsEntity> entity) {
        productResponsitory.delete(entity.get());
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        productResponsitory.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends ProductsEntity> entities) {
        productResponsitory.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        productResponsitory.deleteAll();
    }

    @Override
    public boolean isEmptyUploadFile(MultipartFile[] images) {
        if (images == null || images.length <= 0)
            return true;

        if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
            return true;

        return false;
    }

    @Override
    public boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }


    @Override
    @Transactional
    public ProductsEntity save(ProductsEntity product, MultipartFile inputAvatar, MultipartFile[] inputPictures) throws Exception {
        //Có đẩy avatar lên không
        if(!isEmptyUploadFile(inputAvatar)) {
            inputAvatar.transferTo(new File( UPLOAD_FILE_ROOT +"product/avatar/"+inputAvatar.getOriginalFilename()));
            product.setAvatar("product/avatar/" +inputAvatar.getOriginalFilename());
        }

        //product imgages
        // có đẩy pictures ???
        if (!isEmptyUploadFile(inputPictures)) {
            for (MultipartFile pic : inputPictures) {
                pic.transferTo(new File(UPLOAD_FILE_ROOT + "product/pictures" + pic.getOriginalFilename()));

                ProductsImagesEntity pi = new ProductsImagesEntity();
                pi.setPath("product/pictures/" + pic.getOriginalFilename());
                pi.setTitle(pic.getOriginalFilename());

                product.addRelationProduct(pi);
            }
        }

        return super.saveOrUpdate(product);
    }

    @Override
    public List<ProductsEntity> search(ProductSearch searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT  * FROM tbl_products p  WHERE 1=1";

        // tim kiem san pham theo seachText
        if (!StringUtils.isEmpty(searchModel.getKeyword())) {
            sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
                    + searchModel.getKeyword() + "%'" + " or p.short_description like '%"
                    + searchModel.getKeyword() + "%')";
        }
        if (!StringUtils.isEmpty(searchModel.getOrderBy())){
           if(searchModel.getOrderBy() == 1){
               sql = "SELECT *FROM tbl_products p ORDER BY p.price_sale DESC";
           }
           else if(searchModel.getOrderBy() == 2){
               sql = "SELECT *FROM tbl_products p ORDER BY p.price_sale ASC";
           }
           else if(searchModel.getOrderBy() == 3){
               sql = "SELECT *FROM tbl_products p ORDER BY p.title";
           }
        }

        return executeNativeSql(sql,searchModel.getPage());
    }


    @Override
    public List<ProductsEntity> listProductByCategory(ProductSearch searchModel) {

        String sql = "SELECT  * FROM tbl_products p  WHERE 1=1";

        // tim kiem san pham theo seachText
        if (!StringUtils.isEmpty(searchModel.getCategory_id())) {
            sql += " and (p.category_id like '%" + searchModel.getCategory_id() + "%')";
        }

        return executeNativeSql(sql,searchModel.getPage());
    }

}
