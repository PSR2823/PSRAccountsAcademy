package com.klef.jfsd.springboot.controller;

import java.io.File; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.mail.Session;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
    @Autowired
	private StudentService studentService;
    
    @Autowired
    private AdminService adminService;
    
    @GetMapping("/")
	public ModelAndView main()
	{
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
    
    @GetMapping("aboutus")
  	public ModelAndView aboutus()
  	{
  		ModelAndView mv = new ModelAndView("aboutus");
  		return mv;
  	}
    
    @GetMapping("courses")
   	public ModelAndView courses()
   	{
   		ModelAndView mv = new ModelAndView("courses");
   		return mv;
   	}
    
    @GetMapping("accounts")
   	public ModelAndView accounts()
   	{
   		ModelAndView mv = new ModelAndView("accounts");
   		return mv;
   	}
    
    @GetMapping("sracc")
   	public ModelAndView sracc()
   	{
   		ModelAndView mv = new ModelAndView("sracc");
   		return mv;
   	}
    @GetMapping("indacc")
   	public ModelAndView indacc()
   	{
   		ModelAndView mv = new ModelAndView("indacc");
   		return mv;
   	}
    
    @GetMapping("contactus")
	public ModelAndView contactus()
	{
		ModelAndView mv = new ModelAndView("contactus");
		return mv;
	}
    
    
	
	
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 @PostMapping("sendemail")
	 public ModelAndView sendEmail(HttpServletRequest request) throws Exception 
	 {
	 String name = request.getParameter("name");
	 String toemail = request.getParameter("email");
	 String mobile = request.getParameter("mobile");
	 String subject = request.getParameter("subject");
	 String msg = request.getParameter("message");
	 MimeMessage mimeMessage = mailSender.createMimeMessage();
	 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	 
	 int otp = (int)(Math.random() * 99999); // random number generation 
	 helper.setTo("psrtrainers2823@gmail.com");
	 helper.setSubject(subject);
	 String htmlContent = 
			    "<h3 class='text-xl font-bold text-gray-800'>Contact Form Details</h3>" +
			    "<p class='mt-2'><strong class='text-gray-700'>Name:</strong> " + name + "</p>" +
			    "<p class='mt-2'><strong class='text-gray-700'>Email:</strong> " + toemail + "</p>" +
			    "<p class='mt-2'><strong class='text-gray-700'>Mobile Number:</strong> " + mobile + "</p>" +
			    "<p class='mt-2'><strong class='text-gray-700'>Subject:</strong> " + subject + "</p>" +
			    "<p class='mt-2'><strong class='text-gray-700'>Message:</strong> " + msg + "</p>" +
			    "<p class='mt-2'><strong class='text-gray-700'>OTP:</strong> " + otp + "</p>";
	 helper.setText(htmlContent, true);
	 mailSender.send(mimeMessage);
	 
	 ModelAndView mv = new ModelAndView("mailsuccess");
	 mv.addObject("message", "Email Sent Successfully");
	 return mv;
	 }
	 
	@GetMapping("/studenthome")
	public ModelAndView studenthome()
	{
		ModelAndView mv = new ModelAndView("studenthome");
		return mv;
	}
	
	@GetMapping("studentreg")
	public ModelAndView studentreg()
	{
		ModelAndView mv = new ModelAndView("studentreg");
		return mv;
	}
	
	@PostMapping("insertstudent")
	public ModelAndView insertstudent(HttpServletRequest request) {
	    String name = request.getParameter("sname");
	    String gender = request.getParameter("sgender");
	    String dob = request.getParameter("sdob");
	    String qualification = request.getParameter("squalification");
	    String otherQualification = request.getParameter("otherQualification");
	    String experience = request.getParameter("sexperience");
	    String mobileno = request.getParameter("smobileno");
	    String place = request.getParameter("splace");
	    String email = request.getParameter("semail");
	    String password = request.getParameter("spwd");
	    String status = "Registered";

	 // Check for duplicate email and contact number
	    boolean isEmailDuplicate = studentService.checkEmailExists(email);
	    boolean isContactDuplicate = studentService.checkContactExists(mobileno);

	    ModelAndView mv = new ModelAndView("studentreg");  // Default view for errors

	    if (isEmailDuplicate) {
	        mv.addObject("message", "This email is already registered.");
	        return mv;   
	    }

	    if (isContactDuplicate) {
	        mv.addObject("message", "This contact number is already registered.");
	        return mv;   
	    }
	    
	    Student s = new Student();
	    s.setName(name);
	    s.setGender(gender);
	    s.setDob(dob);
	    s.setQualification(qualification.equals("Others") ? otherQualification : qualification);
	    s.setExperience(experience);
	    s.setMobileno(mobileno);
	    s.setAddress(place);
	    s.setEmail(email);
	    s.setPassword(password);  
	    s.setStatus(status);

	    String msg = studentService.studentreg(s);
	    
	    mv.setViewName("studentregsuccess");
	    mv.addObject("message", msg);

	    return mv;
	}

	private boolean validatePassword(String password) {
	    String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{6,}$";
	    return Pattern.matches(regex, password);
	}


	@GetMapping("studentlogin")
	public ModelAndView studentlogin()
	{
		ModelAndView mv = new ModelAndView("studentlogin");
		return mv;
	}
	
	
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request)
	{
		 ModelAndView mv = new ModelAndView();

	    String email = request.getParameter("semail");
	    String pwd = request.getParameter("spwd");

	    Student s = studentService.checkstudentlogin(email, pwd);
	    if(s != null)
	    {
	        HttpSession session = request.getSession();
	        session.setAttribute("student", s);
	        mv.setViewName("studenthome"); 
	    }
	    else
	    { 
	    	mv.setViewName("studentlogin");
            mv.addObject("loginMessage", "Login Failed. Invalid email or password.");
         }
    
         return mv;

	}
	
	@GetMapping("studentprofile")
	public ModelAndView studentprofile()
	{
	  ModelAndView mv = new ModelAndView("studentprofile");
		return mv;
	}
	
	@GetMapping("updatestudentprofile")
	public ModelAndView updatestudentprofile()
	{
		ModelAndView mv = new ModelAndView("updatestudentprofile");
		return mv;
	}
	
	@PostMapping("update-student-profile")
	public ModelAndView updatestudentprofiles(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		try
		{
			int id = Integer.parseInt(request.getParameter("sid"));
			String name = request.getParameter("sname");
			String gender = request.getParameter("sgender");
	        String dob = request.getParameter("sdob");
	        String email = request.getParameter("semail");
	        String address = request.getParameter("splace");
	        String qualification = request.getParameter("squalification");
	        String experience = request.getParameter("sexperience");
	        String mobileno = request.getParameter("smobileno");
	        
	        Student s = new Student();
	        s.setId(id);
	        s.setName(name);
	        s.setGender(gender);
	        s.setDob(dob);
	        s.setEmail(email);
	        s.setAddress(address);
	        s.setQualification(qualification);
	        s.setExperience(experience);
	        s.setMobileno(mobileno);
	        
	  String msg = studentService.updateStudentProfile(s);
	  
	  Student student = studentService.displayStudentbyId(id);
	  HttpSession session = request.getSession();
	  session.setAttribute("student", s);
			  
	        mv.setViewName("updatesucc");	
	        mv.addObject("message",msg);
	        
		}
		 catch(Exception e)
	     {
	        mv.setViewName("updatestuderror");
	     }
		
		return mv;
	}
	
	 @GetMapping("changepassword")
	    public ModelAndView changepassword()
	    {
	    	ModelAndView mv = new ModelAndView("changepassword");
	    	return mv;
	    }
	
	 @PostMapping("update-change-password")
	    public ModelAndView updatepassword(HttpServletRequest request)
	    {
	    	ModelAndView mv = new ModelAndView();
	    	try
	    	{
	    		int id = Integer.parseInt(request.getParameter("sid"));
	    		String password = request.getParameter("spwd");
	    		
	    		Student s = new Student();
	    		s.setId(id);
	    		s.setPassword(password);
	    		
	    	   String msg = studentService.changePassword(s);
	    	   
	    	   Student student = studentService.displayStudentbyId(id);
	    		  HttpSession session = request.getSession();
	    		  session.setAttribute("student", s);
	    		  mv.setViewName("updatepasswordsucc");	
	    		  mv.addObject("message",msg);
	    	}
	    	 catch(Exception e)
		     {
		        mv.setViewName("updatestuderror");
		     }
	    	
	    	return mv;
	    }
	
	
	
	
	
	@GetMapping("displaycourses")
	public String displaycourses(Model model) {
	    
	    // Fetch all courses
	    List<Course> clist = adminService.ViewAllCourses();
	    model.addAttribute("clist", clist);
	    
	    // Fetch course count
	    long count = adminService.coursecount();
	    model.addAttribute("coursecount", count);

	    Map<Integer, String> coursePageMap = new HashMap<>();
	    coursePageMap.put(7, "/files/Jr.Level Accounts.pdf");
	    coursePageMap.put(8, "/files/Sr.Level Accounts.pdf");
	    coursePageMap.put(9, "/files/Ia & TC.pdf");

	    model.addAttribute("coursePageMap", coursePageMap);



	    return "displaycourses";
	}

	@RequestMapping("course-register")
	public String courseRegister(@RequestParam("cid") Integer courseId, 
	                             @RequestParam("studentid") Integer studentId, 
	                             HttpSession session) {
	    try {
	        if (courseId == null || studentId == null) {
	            session.setAttribute("errorMsg", "Missing Course ID or Student ID.");
	            return "redirect:/registercourses";
	        }

	        // Register the student for the course
	        Register result = studentService.register(courseId, studentId);
	        if (result != null) {
	            session.setAttribute("SuccMsg", "Course registered successfully!");

	            // Get student details from session
	            Student student = (Student) session.getAttribute("student");
	            if (student == null) {
	                session.setAttribute("errorMsg", "Student not logged in.");
	                return "redirect:/login";
	            }

	            // Get details from student object
	            String studentEmail = student.getEmail();
	            String studentName = student.getName();
	            String studentLocation = student.getAddress();
	            String studentQualification = student.getQualification();
	            String studentExperience = student.getExperience();

	            String courseName = studentService.getCourseNameById(courseId);
	            if (courseName == null) {
	                session.setAttribute("errorMsg", "Invalid course ID.");
	                return "redirect:/registercourses";
	            }

	            // Send confirmation email
	            sendRegistrationEmail(studentEmail, courseName, courseId, studentName, studentLocation, studentQualification, studentExperience);
	        } else {
	            session.setAttribute("errorMsg", "Course is already registered.");
	        }
	    } catch (Exception e) {
	        session.setAttribute("errorMsg", "An error occurred during registration.");
	        e.printStackTrace(); // Log the stack trace for debugging
	    }
	    return "redirect:/registercourses";
	}

	private void sendRegistrationEmail(String studentEmail, String courseName, Integer courseId, 
            String studentName, String studentLocation, 
            String studentQualification, String studentExperience) throws Exception {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
			
			// Sending Student Email
			helper.setTo(studentEmail);   
			helper.setSubject("Course Registered Successfully");
			helper.setFrom("no-reply@psraccountsacademy.in");  
			
			// Construct the student-specific email content
			String studentHtmlContent = "<div style='font-family: Arial, sans-serif; border: 1px solid #ddd; border-radius: 10px; padding: 20px; max-width: 600px; margin: 20px auto; background-color: #f3f4f6;'>"
			+ "<div style='background-color: #1f2937; color: #ffffff; padding: 15px; border-top-left-radius: 10px; border-top-right-radius: 10px;'>"
			+ "<h2 style='margin: 0; font-size: 24px; text-align: center;'>Welcome to PSR Accounts Academy 😊</h2>"
			+ "</div>"
			+ "<div style='padding: 20px;'>"
			+ "<p style='font-size: 16px; color: #374151;'>Dear Student,</p>"
			+ "<p style='font-size: 16px; color: #374151;'>Thank you for registering with us! You have successfully enrolled in the course:</p>"
			+ "<p style='font-size: 18px; font-weight: bold; color: #1f2937;'>" + courseName + "</p>"
			+ "<p style='font-size: 16px; color: #374151;'>Please check your emails for updates from PSR Accounts Academy.</p>"
			+ "<p style='font-size: 16px; color: #374151;'>If you have any questions or need assistance, visit our support page at:</p>"
			+ "<p style='font-size: 16px; color: #1d4ed8;'><a href='https://psraccountsacademy.up.railway.app/contactus' target='_blank'>psraccountsacademy.in/support</a></p>"
			+ "<p style='font-size: 16px; color: #374151;'>We are excited to have you on board!</p>"
			+ "</div>"
			+ "<div style='background-color: #1f2937; color: #ffffff; padding: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; text-align: center;'>"
			+ "<p style='font-size: 14px; margin: 0;'>Best regards,<br></p>"
			+ "<p style='font-size: 14px; margin: 0;'>PSR Accounts Academy Support Team</p>"
			+ "<p style='font-size: 14px; margin: 0;'>This is an automated email. Please do not reply to this email as it is not monitored.</p>"
			+ "</div>"
			+ "</div>";
			
			helper.setText(studentHtmlContent, true);
			
			// Send the student email
			mailSender.send(mimeMessage);
			
			// Now, send admin notification (separate email)
			MimeMessage adminMessage = mailSender.createMimeMessage();
			MimeMessageHelper adminHelper = new MimeMessageHelper(adminMessage, true);
			
			adminHelper.setTo("psrtrainers2823@gmail.com");  // Admin email
			adminHelper.setSubject("Student Registration Notification: " + studentName);
			adminHelper.setFrom("no-reply@psraccountsacademy.in");
			
			String adminHtmlContent = "<div style='font-family: Arial, sans-serif; border: 1px solid #ddd; border-radius: 10px; padding: 20px; max-width: 600px; margin: 20px auto; background-color: #f3f4f6;'>"
			        + "<div style='background-color: #1f2937; color: #ffffff; padding: 15px; border-top-left-radius: 10px; border-top-right-radius: 10px;'>"
			        + "<h2 style='margin: 0; font-size: 24px; text-align: center;'>Hello, PSR Accounts Academy</h2>"
			        + "</div>"
			        + "<div style='padding: 20px;'>"
			        + "<p style='font-size: 16px; color: #8B0000; font-weight: bold; text-decoration: underline;'>Registration Status:</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: bold;'>" + studentName + " has successfully registered for the course: " + courseName + " (Course ID: " + courseId + ").</p>"
			        + "<p style='font-size: 16px; color: #8B0000; font-weight: semi-bold; text-decoration: underline;'>Below are the student details:</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: semi-bold;'>Name: " + studentName + "</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: semi-bold;'>Location: " + studentLocation + "</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: semi-bold;'>Qualification: " + studentQualification + "</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: semi-bold;'>Email: " + studentEmail + "</p>"
			        + "<p style='font-size: 16px; color: #374151; font-weight: semi-bold;'>Experience: " + studentExperience + "</p>"
			        + "</div>"
			        + "</div>";


			adminHelper.setText(adminHtmlContent, true);
			
			// Send the admin email
			mailSender.send(adminMessage);
}

	   
 
    @GetMapping("registercourses")
    public String registercourses(HttpSession session, Model model) 
    {
        Student student = (Student) session.getAttribute("student");
        if (student == null) 
        {
            return "redirect:/studentlogin";  
        }
        
        List<Register> register = studentService.getRegisterItemsForStudent(student.getId());
        System.out.println("Register List: " + register); 
        model.addAttribute("register", register);
        return "registercourses";  
    }
    

	@GetMapping("studentsessionexpiry")
	public ModelAndView studentsessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentsessionexpiry");
		return mv;
	}
	
	 @GetMapping("studentlogout")
	  public ModelAndView studentlogout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("studentlogin");
	    return mv;
	  }



}
