package com.haui.shopthoitranghades.Entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.haui.shopthoitranghades.Entity.BaseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class UserEntity extends BaseEntity implements UserDetails{
	/**
	 *
	 */
	private static final long serialVersionUID = -5409485970279961028L;

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 100, nullable = false)
	private String password;

	@Column(name = "email", length = 45, nullable = false)
	private String email;

	@Column(name = "address", length = 45, nullable = false)
	private String address;

	@Column(name = "phone", length = 45, nullable = false)
	private String phone;

	@Column(name = "reset_password_token", length = 45, nullable = true)
	private String resetPasswordToken;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
	private Set<SaleOrderEntity> sales = new HashSet<SaleOrderEntity>();


	public void addRelationSaleOrder(SaleOrderEntity sale) {
		sales.add(sale);
		sale.setUser(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param
	 */
	public void deleteRelationSaleOrder(SaleOrderEntity sale) {
		sales.remove(sale);
		sale.setUser(null);
	}

	public Set<SaleOrderEntity> getSales() {
		return sales;
	}

	public void setSales(Set<SaleOrderEntity> sales) {
		this.sales = sales;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private List<RoleEntity> roles = new ArrayList<RoleEntity>();

	public void addRoles(RoleEntity role) {
		role.getUser().add(this);
		roles.add(role);
	}

	public void deleteRoles(RoleEntity role) {
		role.getUser().remove(this);
		roles.remove(role);
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	private List<ReviewEntity> reviews = new ArrayList<>();

	public void addUserReview(ReviewEntity review) {
		reviews.add(review);
		review.setUser(this);
	}

	public void deleteReview(ReviewEntity review) {
		reviews.remove(review);
		review.setUser(null);
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public List<RoleEntity> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}



	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return super.getStatus();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
