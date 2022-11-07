package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.UserEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface UserResponsitory extends CrudRepository<UserEntity,Integer> {

//    @Query("SELECT FROM tbl_users c WHERE c.email = ?1")



    public UserEntity findByEmail(String email);

    public UserEntity findByResetPasswordToken(String token);
}
