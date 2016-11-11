package com.le.leface.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.le.leface.dao.AbstractDao;
import com.le.leface.dao.UserDao;
import com.le.leface.models.User;

@Repository
public class UserDaoImpl extends AbstractDao<Long, User> implements UserDao {

	public void save(User user) {
		persist(user);
	}

	public void delete(User user) {
		super.delete(user);
	}
	
    @SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria();
        return (List<User>) criteria.list();
    }
    
    public User findById(Long id) {
		return getByKey(id);	
	}
	
	public User findByFaceId(String faceId) {
	       Criteria criteria = createEntityCriteria();
	       criteria.add(Restrictions.eq("face_id", faceId));
	       return (User) criteria.uniqueResult();
	}
}
