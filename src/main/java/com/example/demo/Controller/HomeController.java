package com.example.demo.Controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.Config.FilesStuff;
import com.example.demo.Dao.StudentBeanDao;
import com.example.demo.model.StudentBean;

@Controller
public class HomeController {

	@Autowired
	StudentBeanDao studentBeanDao;
	@Autowired
	FilesStuff fileTemplate;
	
	

	@RequestMapping("/display")

	public String showJson(Model model,@ModelAttribute StudentBean sbean, RedirectAttributes redir) {
		model.addAttribute("sbean", new StudentBean());
		List<StudentBean> list = studentBeanDao.showStudentBeanDetails();

		model.addAttribute("studentList", list);
		return "home";
	}

	@RequestMapping("/first")
	public String firstPage(Model model, @ModelAttribute StudentBean objStudent, @RequestParam("fileUpload") MultipartFile[] uploadedFiles,RedirectAttributes redir) throws IOException {

		int dummyid = 0;
		StudentBean sbean = studentBeanDao.checkStudentExistOrNot(objStudent);
		if (sbean != null) {
			dummyid = sbean.getStdId();
		}

		/*
		 * int dummyid=0; if(sbean ==null) { sbean.setStdId(dummyid);
		 * System.out.println(sbean.getStdId()); } System.out.println(objStudent);
		 */

		if (objStudent.getStdId() == 0) {
			// new record
			if (null == sbean) {
				 int filecount =0;
			
	        	 
	        	 for(MultipartFile multipartFile : uploadedFiles) {
	    				String fileName = multipartFile.getOriginalFilename();
	    				if(!multipartFile.isEmpty())
	    				{
	    					filecount++;
	    				 multipartFile.transferTo(fileTemplate.moveFileTodir(fileName));
	    				}
	    			}
	        	 
	        	 if(filecount>0)
	        	 {
	        		 StudentBean.setfileUpload(fileTemplate.concurrentFileNames());
	        		 fileTemplate.clearFiles();
	        		 
	        	 }
				
				studentBeanDao.save(objStudent);
				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");

			} else {
				System.out.println("Record already exists");
			}
		} else { // edit recored

			if (dummyid == objStudent.getStdId() || sbean == null) {
				 int filecount =0;
	        	 
	        	 for(MultipartFile multipartFile : uploadedFiles) {
	    				String fileName = multipartFile.getOriginalFilename();
	    				if(!multipartFile.isEmpty())
	    				{
	    					filecount++;
	    				 multipartFile.transferTo(fileTemplate.moveFileTodir(fileName));
	    				}
	    			}
	        	 
	        	 if(filecount>0)
	        	 {
	        		 StudentBean.setfileUpload(fileTemplate.concurrentFileNames());
	        		 fileTemplate.clearFiles();
	        		 
	        	 }

				studentBeanDao.save(objStudent);
				redir.addFlashAttribute("msg", "Record updated successfully");
				redir.addFlashAttribute("cssMsg", "info");
			} else {

				System.out.println("Record already exists");
			}

		}

		return "redirect:display";

	}

	@RequestMapping(value = "/deleteStudent", method = RequestMethod.GET)
	public String deleteStudent(@RequestParam("stdId") int stdId, RedirectAttributes redir) {

		studentBeanDao.deleteStudentRecordById(stdId);
		redir.addFlashAttribute("msg", "Record deleted Sucessfully");
		redir.addFlashAttribute("cssMsg", "danger");

		return "redirect:display";

	}

	@RequestMapping(value = "/editStudent")
	public String editStudent(@RequestParam(value = "stdId", required = true) String id, Model model,
			RedirectAttributes redir) {
		// studentDao.editStudentRecordByid(id);

		model.addAttribute("sbean", studentBeanDao.getStudentRecordById(id));

		List<StudentBean> slist = studentBeanDao.showStudentBeanDetails();

		model.addAttribute("studentList", slist);

		return "home";
	}

}
