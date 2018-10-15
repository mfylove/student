package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mapper.StudentMapper;
import model.Student;

@Service

public class StudentService {
	@Autowired
	private StudentMapper mapper;

	public List<Student> findAll(){

		List<Student> list = mapper.selectAll();
		return list;
	}
	public  int findlike(String search){
		if(search==null){
			search="";
		}
		return mapper.selectlike(search);
	}
	public List<Student> findLimit(int offset,int pageCount,String search,String order){
		
		List<Student> list = mapper.selectlimit(offset, pageCount,search,order);
		return list;
	}
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void addStudent(Student student) {
		mapper.insertStudent(student);
		
	}
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void modifyStudent(Student student) {
		mapper.updateStudent(student);
		
	}
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public void removeStudent(Student student) {
		mapper.deleteStudent(student);
		
	}
}
