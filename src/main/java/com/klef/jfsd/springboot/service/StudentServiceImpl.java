package com.klef.jfsd.springboot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Register;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.RegisterRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private RegisterRepository registerRepository;

	@Override
	public String studentreg(Student s) 
	{
	  studentRepository.save(s);
	  return "Student Registered Successfully";
	}

	@Override
	public Student checkstudentlogin(String email, String pwd) 
	{
	   return studentRepository.checkstudentlogin(email, pwd);
	}

	public boolean checkEmailExists(String email) 
	  {
	        return studentRepository.findByEmail(email) != null;
	    }

	   
	    @Override
	    public boolean checkContactExists(String contact) 
	    {
	        return studentRepository.findByContact(contact) != null;
	    }

		@Override
		public List<Course> ViewAllCourses() 
		{
			return (List<Course>) courseRepository.findAll();
		}

		@Override
		public Register register(int courseid, int studentid) {
		    Optional<Student> studentOpt = studentRepository.findById(studentid);
		    Optional<Course> courseOpt = courseRepository.findById(courseid);

		    if (studentOpt.isPresent() && courseOpt.isPresent()) {
		        Student student = studentOpt.get();
		        Course course = courseOpt.get();
		        Register existing = registerRepository.findByCourseIdAndStudentId(courseid, studentid);

		        if (existing == null) {
		            Register register = new Register();
		            register.setCourseid(course);
		            register.setStudentid(student);
		            return registerRepository.save(register);
		        } else {
		            return existing; // Already registered
		        }
		    } else {
		        throw new RuntimeException("Student or Course not found");
		    }
		}


		@Override
		public List<Register> getRegisterItemsForStudent(int studentid) {
			 List<Register> register = registerRepository.findByStudentId(studentid);
			 
			 return register;
		}

		@Override
		public boolean isAlreadyRegistered(Integer courseId, Integer studentId) 
		{
		     
		    return registerRepository.existsByStudentIdAndCourseId(studentId, courseId);
		}

		public String getCourseNameById(Integer courseId) {
		    // Assuming you have a method in your repository to fetch the course name by ID
		    Optional<Course> courseOptional = courseRepository.findById(courseId);
		    if (courseOptional.isPresent()) 
		    {
		        return courseOptional.get().getName();
		    }
		    else 
		    {
		        throw new EntityNotFoundException("Course with ID " + courseId + " not found.");
		    }
		}

		@Override
		public String updateStudentProfile(Student student) 
		{
		   Student s = studentRepository.findById(student.getId()).get();
		   
		   s.setName(student.getName());
		   s.setGender(student.getGender());
		   s.setDob(student.getDob());
		   s.setEmail(student.getEmail());
		   s.setAddress(student.getAddress());
		   s.setQualification(student.getQualification());
		   s.setExperience(student.getExperience());
		   s.setMobileno(student.getMobileno());
		   
		   studentRepository.save(s);
		   
		   return "Student Updated Successfully";
		}
		
		

		@Override
		public Student displayStudentbyId(int sid) 
		{
			return studentRepository.findById(sid).get();
		}

		@Override
		public String changePassword(Student student) 
		{
			  Student s = studentRepository.findById(student.getId()).get();
		   
		   s.setPassword(student.getPassword());
		   studentRepository.save(s);
		   
		   return "Password Updated";
		}
}
