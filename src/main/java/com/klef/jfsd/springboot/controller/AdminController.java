package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController
{
    @Autowired
	private AdminService adminService;
   
   
   @GetMapping("admindashboard")
  	public ModelAndView admindashboard()
  	{
  		ModelAndView mv = new ModelAndView("admindashboard");
  		return mv;
  	}
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String username = request.getParameter("auname");
		String pwd = request.getParameter("apwd");
		
		Admin a = adminService.checkadminlogin(username, pwd);
		if(a!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", a);
			mv.setViewName("adminhome");
		}
		else
		{
			mv.setViewName("adminloginfail");
			mv.addObject("message", "Login Failed ! Please Check Your Credentials");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView("adminhome");
		
		long scount = adminService.studentcount();
		mv.addObject("studentcount", scount);
		
		long ccount = adminService.coursecount();
		mv.addObject("coursecount",ccount);
		
		long regcoursecount = adminService.regcoursecount();
		mv.addObject("regcoursecount",regcoursecount);
	  
	    return mv;
	}
	
	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents()
	{
		ModelAndView mv = new ModelAndView("viewallstudents");
		List<Student> slist = adminService.viewallstudents();
		mv.addObject("slist",slist);
		
		long count = adminService.studentcount();
		mv.addObject("studentcount",count);
		
		return mv;
	}
	
	@GetMapping("deletestudent")
	public String deletestudentoperation(@RequestParam("id") int sid)
	{
		adminService.deletestudent(sid);
		return "redirect:/viewallstudents";
	}
	
	@GetMapping("deletecourse")
	public String deletecourseoperation(@RequestParam("id") int cid)
	{
		adminService.deletecourse(cid);
		return "redirect:/viewallcourses";
	}
	
	 @GetMapping("addcourse")
	 public ModelAndView addcourse()
	 {
		 ModelAndView mv = new ModelAndView("addcourse");
		 return mv;
	 }
	 
	 @PostMapping("insertcourse")
	 public ModelAndView insertcourse(HttpServletRequest request)
	 {
		 String name = request.getParameter("cname");
		 String details = request.getParameter("cdetails");
		 String duration = request.getParameter("cduration");
		 String eligibility = request.getParameter("celigibility");
		 
		 ModelAndView mv = new ModelAndView("addcourse");
		 Course c = new Course();
		 c.setName(name);
		 c.setDetails(details);
		 c.setDuration(duration);
		 c.setEligibility(eligibility);
		 
		 String msg = adminService.AddCourse(c);
		 
		 mv.setViewName("coursesuccess");
		 mv.addObject("message",msg);
		 
		 return mv;
	 }
	 
	 @GetMapping("regcourses")
	 public ModelAndView regcourses() 
	 {
	     ModelAndView mv = new ModelAndView();
	     List<Register> rlist = adminService.viewallregcourses();
	     mv.setViewName("regcourses");  
	      mv.addObject("rlist", rlist); 
	     long regcount = adminService.regcoursecount();  
	     mv.addObject("regcoursecount", regcount); 
	     return mv;
	 }

	 
	 @GetMapping("updatecourse")
	 public ModelAndView editCourseForm(@RequestParam("id") int id) {
	     ModelAndView mv = new ModelAndView("updatecourse");

	     try {
	         Course course = adminService.ViewCourseById(id);  
	         mv.addObject("course", course);  
	     } 
	     catch (Exception e) 
	     {
	         mv.setViewName("updateerror");
	         mv.addObject("message", e.getMessage());
	     }

	     return mv;
	 }


	    @PostMapping("updatecourseprofile")
	    public ModelAndView updateCourseProfile(HttpServletRequest request)
	    {
	        ModelAndView mv = new ModelAndView();

	        try
	        {
	            int id = Integer.parseInt(request.getParameter("cid"));
	            String name = request.getParameter("cname");
	            String details = request.getParameter("cdetails");
	            String duration = request.getParameter("courseDuration");
	            String eligibility = request.getParameter("courseEligibility");

	            Course course = new Course();
	            course.setId(id);
	            course.setName(name);
	            course.setDetails(details);
	            course.setDuration(duration);
	            course.setEligibility(eligibility);

	            String msg = adminService.updateCourse(course);

	            mv.setViewName("updatesuccess");
	            mv.addObject("message", msg);
	        }
	        catch (Exception e)
	        {
	            mv.setViewName("updateerror");
	            mv.addObject("message", e.getMessage());
	        }

	        return mv;
	    }
	 
	    
	 
	 
	  
	@GetMapping("adminsessionexpiry")
	public ModelAndView adminsessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionexpiry");
		return mv;
	}
	
	 @GetMapping("adminlogout")
	  public ModelAndView adminlogout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminlogin");
	    return mv;
	  }

}
