package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.StudentBeanDao;
import com.example.demo.model.StudentBean;

@Controller
public class HomeController {
	
	@Autowired
	StudentBeanDao studentBeanDao;
	
	
	@RequestMapping("/display")	
	public String showJson(Model model)
	{
		
		model.addAttribute("sbean", new StudentBean());
		
		
		return "home";
	}

	/*@RequestMapping("/first")
	public String firstPage(Model model,HttpServletRequest request,HttpServletResponse response)
	{
		request.getParameter("stdId");
		request.getParameter("stdName");
		request.getParameter("stdAddr");
		request.getAttribute("stdId");
		return null;
		
		
	}*/
	
	
	@RequestMapping("/first")
	public String firstPage(Model model, @ModelAttribute  StudentBean objStudent)
	{
		
		System.out.println(objStudent);
		
		studentBeanDao.save(objStudent);
		
		/*for(StudentBean entry:objStudent)
		{
			System.out.println(entry.getStdAddr());
			System.out.println(entry.getStdName());
			
	}*/
		
		
		return "redirect:display";
		
		
	}
	
	

}