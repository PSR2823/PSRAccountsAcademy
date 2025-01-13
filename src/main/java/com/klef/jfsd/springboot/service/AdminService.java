package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;

public interface AdminService 
{
	public Admin checkadminlogin(String username, String password);
	
	public List<Student> viewallstudents();
	public long studentcount();
	
	public String deletestudent(int sid);
	
	public Student displayStudentById(int sid);
	
	public String AddCourse(Course course);
	public List<Course> ViewAllCourses();
	public Course ViewCourseById(int cid);
	public long coursecount();
	public long regcoursecount();
	
	public String updateCourse(Course c);
	public String deletecourse(int cid);
	
	public List<Register> viewallregcourses();

}
