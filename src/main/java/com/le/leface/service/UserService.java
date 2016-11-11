package com.le.leface.service;

import java.util.List;

import com.le.leface.models.User;

public interface UserService {
	
	public void addUser(User p);

	public List<User> getAllUsers();
	
	public User getUserById(Long id);

	public User getUserByFaceId(String faceId);

	public void deleteUser(User user);
}
