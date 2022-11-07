package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Entity.UserEntity;
import com.haui.shopthoitranghades.Responsitory.UserResponsitory;
import com.haui.shopthoitranghades.Service.Impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserService extends BaseService<UserEntity> {

	@Override
	protected Class<UserEntity> clazz() {
		// TODO Auto-generated method stub
		return UserEntity.class;
	}
	
	public UserEntity loadUserByUserName(String userName) {
		String sql = "select * from tbl_users u where u.username = '"+ userName +"'";
		List<UserEntity> users= this.executeNativeSql(sql, -1);
		if(users == null || users.size() <=0) {
			return null;
		}
		return users.get(0);
	}

	public UserEntity loadUserByEmail(String email) {
		String sql = "select * from tbl_users u where u.username = '"+ email +"'";
		List<UserEntity> users= this.executeNativeSql(sql, -1);
		if(users == null || users.size() <=0) {
			return null;
		}
		return users.get(0);
	}

	@Transactional
	public UserEntity save(UserEntity user) {
		
		return super.saveOrUpdate(user);
	}

	@Autowired(required = false)
	private UserResponsitory customerRepo;


	public void updateResetPasswordToken(String token, String email) throws Exception {
		UserEntity customer = customerRepo.findByEmail(email);
		if (customer != null) {
			customer.setResetPasswordToken(token);
			customerRepo.save(customer);
		} else {
			throw new Exception("Could not find any customer with the email " + email);
		}
	}

	public UserEntity getByResetPasswordToken(String token) {
		return customerRepo.findByResetPasswordToken(token);
	}

	public void updatePassword(UserEntity customer, String newPassword) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(newPassword);
		customer.setPassword(encodedPassword);

		customer.setResetPasswordToken(null);
		customerRepo.save(customer);
	}

}
