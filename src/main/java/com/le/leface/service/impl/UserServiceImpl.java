package com.le.leface.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.le.leface.dao.UserDao;
import com.le.leface.models.User;
import com.le.leface.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Transactional
	public void addUser(User p) {
		this.userDao.save(p);
	}

	@Transactional
	public List<User> getAllUsers() {
		return this.userDao.findAllUsers();
	}
	
	@Transactional
	public User getUserById(Long id) {
		return this.userDao.findById(id);
	}

	@Transactional
	public User getUserByFaceId(String faceId) {
		return this.userDao.findByFaceId(faceId);
	}

	
	@Transactional
	public void deleteUser(User user) {
		this.userDao.delete(user);
	}
}
