package com.example.demo.Controller;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

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
import com.example.demo.Dao.StudentDao;
import com.example.demo.model.Student;

@Controller
public class StudentController {
	
	@Autowired
	StudentDao studentDao;
	@Autowired
	FilesStuff fileTemplate;
	
	
@RequestMapping("/studenttest")	
	public String showHomePage(Model model)
	{
	  model.addAttribute("student",new Student());
	  
	  List<Student> slist=studentDao.getStudentList();
	  
	  model.addAttribute("slist",slist);
	  
	   
		return "student";
	}
@RequestMapping(value = "/studenttest", method = RequestMethod.POST)
public String saveStudent(@Valid @ModelAttribute  Student student,Model model,@RequestParam("file1") MultipartFile[] uploadedFiles,RedirectAttributes redir) throws IOException {
	//System.out.println("entering into post....");
	
	// Boolean result =studentDao.checkRecordExistsOrNot(student);
	int did= 0;
	int id = 0;
	if(student.getId()!=0)
	{
		 did =student.getId();
	}
	
     Student sbean =studentDao.GetStudentRecordByMobileNo(student); 
     if(student.getId() != 0)		
     {
    	 id = sbean	.getId();
    	 if(id == did && sbean != null)
			{
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
        		 student.setFiles(fileTemplate.concurrentFileNames());
        		 fileTemplate.clearFiles();
        		 
        	 }
    		 studentDao.SaveOrUpdate(student);
    		 redir.addFlashAttribute("msg", "Record updated successfully");
    			redir.addFlashAttribute("cssMsg", "info");
			}
    	 else
			{
				redir.addFlashAttribute("msg", "Record Already Exists");
				redir.addFlashAttribute("cssMsg", "warning");
			}
    	 
     }
     
     if(student.getId() == 0 && sbean== null)
		{
    	 
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
    		 student.setFiles(fileTemplate.concurrentFileNames());
    		 fileTemplate.clearFiles();
    		 
    	 }

			
    	 studentDao.SaveOrUpdate(student);


			redir.addFlashAttribute("msg", "Record Inserted Successfully");
			redir.addFlashAttribute("cssMsg", "success");
		}
     if(student.getId() == 0 && sbean != null)
		{
			redir.addFlashAttribute("msg", "Record Already Exists");
			redir.addFlashAttribute("cssMsg", "warning");
			
		}
     return "redirect:/studenttest";
			
     
	 
	} 


@SuppressWarnings("unused")
@RequestMapping("/studentlist")	
public void showStudentsList(Model model)
{
    List<Student> slist=studentDao.getStudentList(); 
}

// comment added
@RequestMapping(value = "/deletestudent")
public String  deleteStudent(@RequestParam(value="id", required=true) String id,Model model,RedirectAttributes redir) {
		studentDao.deleteStudentRecordByid(id);
		redir.addFlashAttribute("msg", "Record deleted");
		redir.addFlashAttribute("cssMsg", "danger");
		return "redirect:studenttest";
	}
@RequestMapping(value = "/editstudent")
public String  editStudent(@RequestParam(value="id", required=true) String id,Model model,RedirectAttributes redir)
	{
		//studentDao.editStudentRecordByid(id);
		
		model.addAttribute("student",studentDao.getStudentById(id));
		  
		  List<Student> slist=studentDao.getStudentList();
		  
		  model.addAttribute("slist",slist);
		
		return "student";
	}
}

