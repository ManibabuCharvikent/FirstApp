package com.example.demo.Dao;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Place;
@Repository
@Transactional
public class PlaceDao {
	@Autowired
	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) 
	{
		this.sessionFactory = sf;
	}
	 public void SaveOrUpdate(Place place)
	  {
		  sessionFactory.getCurrentSession().saveOrUpdate(place);  
	  }
	 @SuppressWarnings("unchecked")
		public List<Place> getPlaceList()
		 {
			 String hql ="from Place";
			 Query query=sessionFactory.getCurrentSession().createQuery(hql); 
			 List<Place> list=query.list();
			 for(Place p:list)
			 {
			 System.out.println(p.getName());
			 } 			 
			return list;					 
		 }
}
