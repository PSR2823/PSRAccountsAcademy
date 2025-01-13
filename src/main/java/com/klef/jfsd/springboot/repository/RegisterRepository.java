package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Register;

import jakarta.transaction.Transactional;

@Repository
public interface RegisterRepository extends JpaRepository<Register, Integer>
{
	@Query("SELECT r FROM Register r WHERE r.courseid.id = :courseid AND r.studentid.id = :studentid")
	public Register findByCourseIdAndStudentId(@Param("courseid") int courseid, @Param("studentid") int studentid);

	@Query("SELECT r FROM Register r WHERE r.studentid.id = :studentid")
	public List<Register> findByStudentId(@Param("studentid") int studentid);
	
	@Query("SELECT COUNT(r) > 0 FROM Register r WHERE r.studentid.id = :studentId AND r.courseid.id = :courseId")
	public boolean existsByStudentIdAndCourseId(@Param("studentId") Integer studentId, @Param("courseId") Integer courseId);


	@Modifying
	@Transactional
	@Query("DELETE FROM Register r WHERE r.studentid.id = :studentId")
	public void deleteByStudentId(@Param("studentId") int studentId);


}
