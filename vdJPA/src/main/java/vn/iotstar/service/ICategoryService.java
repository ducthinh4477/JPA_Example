package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.CategoryEntity;
import vn.iotstar.repository.ICategoryRepository;
import vn.iotstar.repository.IUserPepository;
import vn.iotstar.repository.impl.CategoryRepository;
import vn.iotstar.repository.impl.UserRepository;

public interface ICategoryService {

	List<CategoryEntity> findByUserId(int userId);

	List<CategoryEntity> findAll();

	CategoryEntity findById(int id);

	void delete(int cateId, int userId) throws Exception;

	void update(CategoryEntity cate) throws Exception;

	void create(CategoryEntity cate) throws Exception;

	ICategoryRepository categoryRepo = new CategoryRepository();
	IUserPepository userRepo = new UserRepository();

}
