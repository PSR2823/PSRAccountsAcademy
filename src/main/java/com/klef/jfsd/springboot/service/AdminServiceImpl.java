package com.klef.jfsd.springboot.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.RegisterRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private RegisterRepository registerRepository;

	@Override
	public Admin checkadminlogin(String username, String password) 
	{
		return adminRepository.checkadminlogin(username, password);
	}

	@Override
	public List<Student> viewallstudents() 
	{
		return studentRepository.findAll();
	}

	@Override
	public long studentcount() 
	{
	   return studentRepository.count();
	}

	@Override
	public String deletestudent(int sid) 
	{
		registerRepository.deleteByStudentId(sid);
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}

	@Override
	public Student displayStudentById(int sid) 
	{	 
		 return studentRepository.findById(sid).get();
	}

	@Override
	public String AddCourse(Course course) 
	{
	    courseRepository.save(course);
	   return "Course Added Successfully";
	}

	@Override
	public List<Course> ViewAllCourses()
	{
		return  courseRepository.findAll(); 
	}

	@Override
	public long coursecount()
	{
	   return courseRepository.count();	 
	}

	@Override
	public Course ViewCourseById(int cid)
	{
      return courseRepository.findById(cid).get();
	}

	@Override
	public String updateCourse(Course c) 
	{
	  Course course = courseRepository.findById(c.getId()).get();
	  
	  course.setName(c.getName());
	  course.setDetails(c.getDetails());
	  course.setDuration(c.getDuration());
	  course.setEligibility(c.getEligibility());
	  
	  courseRepository.save(course);
	  
	  return "Course Updated Succesfully";
	}

	@Override
	public String deletecourse(int cid) 
	{
		 courseRepository.deleteById(cid);
		 return "Course Deleted Successfully";
	}

	@Override
	public long regcoursecount() 
	{ 
		 return registerRepository.count();
	}

	@Override
	public List<Register> viewallregcourses() 
	{
	    return (List<Register>) registerRepository.findAll();	
	}
	
	


}
