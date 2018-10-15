package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Student;
public interface StudentMapper {
   
	public List<Student> selectAll();
	
	public List<Student> selectlimit(@Param("offset") int offset,@Param("pageCount") int pageCount,@Param("search") String search,@Param("order") String order);
	
	public void insertStudent(Student student);
	
	public void updateStudent(Student student);

	public void deleteStudent(Student student);

	public int selectlike(@Param("search") String search);

}