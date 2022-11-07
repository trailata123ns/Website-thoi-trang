package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Dto.ProductSearch;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ProductsImagesEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.util.List;
import java.util.Optional;

import static com.haui.shopthoitranghades.Dto.Constants.UPLOAD_FILE_ROOT;

public interface ProductService {

    List<ProductsEntity> findAll(Sort sort);

    Page<ProductsEntity> findAll(Pageable pageable);

    ProductsEntity  save(ProductsEntity entity);

    List<ProductsEntity> saveAll(List<ProductsEntity> entities);

    Optional<ProductsEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    List<ProductsEntity> findAll();

    List<ProductsEntity> findAllById(List<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(Optional<ProductsEntity> entity);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends ProductsEntity> entities);

    void deleteAll();

    boolean isEmptyUploadFile(MultipartFile[] images);

    boolean isEmptyUploadFile(MultipartFile image);

    @Transactional
    default ProductsEntity edit(ProductsEntity product, MultipartFile inputAvatar, MultipartFile[] inputPictures) throws Exception {
        //Có đẩy avatar lên không
        // lay thong tin san pham trong db.
        Optional<ProductsEntity> productOnDb = findById(product.getId());

        // có đẩy avartar ???
        if(!isEmptyUploadFile(inputAvatar)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FILE_ROOT + productOnDb.get().getAvatar()).delete();

            // add avartar moi
            inputAvatar.transferTo(new File(UPLOAD_FILE_ROOT + "product/avatar/" + inputAvatar.getOriginalFilename()));
            product.setAvatar("product/avatar/" + inputAvatar.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            product.setAvatar(productOnDb.get().getAvatar());
        }

        // có đẩy pictures ???
        if (!isEmptyUploadFile(inputPictures)) {


            for (MultipartFile pic : inputPictures) {
                pic.transferTo(new File(UPLOAD_FILE_ROOT + "product/pictures/" + pic.getOriginalFilename()));

                ProductsImagesEntity pi = new ProductsImagesEntity();
                pi.setPath("product/pictures/" + pic.getOriginalFilename());
                pi.setTitle(pic.getOriginalFilename());

                product.addRelationProduct(pi);
            }
        }

        return save(product);
    }

    @Transactional
    ProductsEntity save(ProductsEntity product, MultipartFile inputAvatar, MultipartFile[] inputPictures) throws Exception;

    List<ProductsEntity> search(ProductSearch searchModel);

    List<ProductsEntity> listProductByCategory(ProductSearch searchModel);

    List<ProductsEntity> findByStatus(Boolean status) throws Exception;

    List<ProductsEntity> findTop8NewProduct() throws Exception;

    List<ProductsEntity> findTop8ProductHot() throws Exception;

}
