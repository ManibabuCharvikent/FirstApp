package com.example.demo.Dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.StudentBean;

@Repository
@Transactional
public class StudentBeanDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	
	public void save(StudentBean studentBean)
	  {
		  sessionFactory.getCurrentSession().saveOrUpdate(studentBean);
		  
	  }

}
