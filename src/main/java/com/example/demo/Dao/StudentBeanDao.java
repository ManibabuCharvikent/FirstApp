package com.example.demo.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.StudentBean;

@Repository
@Transactional
public class StudentBeanDao {

	@Autowired
	SessionFactory sessionFactory;

	public void save(StudentBean studentBean) {
		sessionFactory.getCurrentSession().saveOrUpdate(studentBean);

	}

	public List<StudentBean> showStudentBeanDetails() {
		String hql = "from StudentBean";
		List<StudentBean> list = sessionFactory.getCurrentSession().createQuery(hql).list();

		return list;

	}

	public StudentBean checkStudentExistOrNot(StudentBean objStudent) {

		String hql = "from StudentBean where stdPhone='" + objStudent.getStdPhone() + "'";
		Query q = sessionFactory.getCurrentSession().createQuery(hql);

		List<StudentBean> studentData = q.list();

		if (studentData.size() > 0) {
			return studentData.get(0);

		} else {
			return null;
		}

	}

	public void deleteStudentRecordById(int stdId) {

		String hql = "delete from StudentBean where  stdId=" + stdId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		query.executeUpdate();

	}

	public StudentBean editStudentRecordById(int stdId) {

		String hql = "from StudentBean where stdId=" + stdId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<StudentBean> list = query.list();
		if (list.size() > 0) {

			return list.get(0);
		}

		return null;
	}

	public Object getStudentRecordById(String stdId) {

		String hql = "from StudentBean where stdId=" + stdId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<StudentBean> list = query.list();
		if (list.size() > 0) {
			return list.get(0);
		}
		return list;
	}

}
