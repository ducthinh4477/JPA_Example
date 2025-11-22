package vn.iotstar.repository;

import java.util.List;

import vn.iotstar.entity.UserEntity;

public interface IUserPepository {

	List<UserEntity> findAll();

	UserEntity findById(int id);

	void delete(int id);

	void update(UserEntity entity);

	void create(UserEntity entity);
	
	boolean existsUsername(String username);
	
	boolean existsEmail(String email);
	
	boolean existsPhone(String phone);

    UserEntity findByEmail(String email);

}
