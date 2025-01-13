package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;

public interface StudentService
{
	public String studentreg(Student s);
	public Student checkstudentlogin(String email, String pwd);
	
	   public boolean checkEmailExists(String email);	 
	   public boolean checkContactExists(String contact);
	   
	   public List<Course> ViewAllCourses();   
	   
	     public Register register(int courseid, int studentid);
	     public List<Register> getRegisterItemsForStudent(int studentid);
	     
	     public boolean isAlreadyRegistered(Integer courseId, Integer studentId);
	     
	     public String getCourseNameById(Integer courseId);
	     
	     public String updateStudentProfile(Student student);
	     public String changePassword(Student student);
	     
	     public Student displayStudentbyId(int sid);
}

