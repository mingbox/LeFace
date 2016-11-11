package com.le.leface.dao;

import java.util.List;

import com.le.leface.models.User;

public interface UserDao {

	public void save(User user);

	public void delete(User user);
	
	public List<User> findAllUsers();
    
    public User findById(Long id);
	
	public User findByFaceId(String faceId);
}
