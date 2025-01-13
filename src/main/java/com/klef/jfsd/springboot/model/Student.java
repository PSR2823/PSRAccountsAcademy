package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student 
{
 @Id
@GeneratedValue(strategy = GenerationType.IDENTITY)  
private int id;  
	
	@Column(name = "student_name", nullable = false, length = 50)
	private String name;
	
	@Column(name = "student_gender", nullable = false, length = 50)
	private String gender;
	    
	@Column(name = "student_dob", nullable = false, length = 50)
	private String dob;
	    
	@Column(name = "student_qualification", nullable = false, length = 100)
	private String qualification;
	
	@Column(name = "student_experience", nullable = false, length = 100)
	private String experience;
	
	@Column(name = "student_mobileno", nullable = false, length = 10)
	private String mobileno;
	
	@Column(name = "student_email", nullable = false, length = 100)
	private String email;
	
	@Column(name = "student_password", nullable = false, length = 500)
	private String password;
	
	@Column(name = "student_address", nullable = false, length = 100)
	private String address;
	
	@Column(name = "student_status", nullable = false, length = 50)
	private String status;
		   
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
