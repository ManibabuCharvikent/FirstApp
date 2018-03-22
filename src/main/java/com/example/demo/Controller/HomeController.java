package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Dao.StudentBeanDao;
import com.example.demo.model.StudentBean;

@Controller
public class HomeController {
	
	@Autowired
	StudentBeanDao studentBeanDao;
	
	
	@RequestMapping("/display")	
	public String showJson(Model model, @ModelAttribute("sbean") StudentBean student)
	{
		model.addAttribute("sbean",student);
		List<StudentBean> list=studentBeanDao.showStudentBeanDetails();

		model.addAttribute("studentList", list);
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
		
		  StudentBean sbean =studentBeanDao.checkStudentExistOrNot(objStudent);
		  
		  if(null == sbean)
		  {
		
		
		studentBeanDao.save(objStudent);
		  }
else
{
	System.out.println("recored already exist");

		/*for(StudentBean entry:objStudent)
		{
			System.out.println(entry.getStdAddr());
			System.out.println(entry.getStdName());
			
	}*/
		
}
		return "redirect:display";
		
		
}
	
	@RequestMapping(value="/deleteStudent", method=RequestMethod.GET)
	public String deleteStudent(@RequestParam("stdId")int stdId)
	{
	studentBeanDao.deleteStudentRecordById(stdId);
	
	return "redirect:display";
	
	}

	@RequestMapping(value="/editStudent",method=RequestMethod.GET)
	public String editStudent(@RequestParam("stdId")String stdId)
	{
	studentBeanDao.editStudentRecordById(stdId);
	return "redirect:display";
	}
	}
