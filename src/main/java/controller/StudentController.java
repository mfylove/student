package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import model.PageBean;
import model.Student;
import model.Users;
import service.StudentService;
import service.UsersService;

@Controller
public class StudentController {
	@Autowired
	private StudentService stu;
	@Autowired
	private UsersService service;
	@RequestMapping("/login.do")
	public String login() {
		
		return "login";
	}
	@RequestMapping("/loginout.do")
	public String loginout(HttpSession session) {
		session.removeAttribute("sessionUser");
		return "login";
	}
	@RequestMapping("/students.do")
	public String students() {
		
		return "student";
	}
	@RequestMapping("/tologin.do")
	@ResponseBody
	public String tologin(Users user,HttpSession session) {
		System.out.println(user);
		Users user2 = service.findByUsername(user);
		//System.out.println(user);
		if(user2!=null&&(user.getPassword()).equals(user2.getPassword())) {
			session.setAttribute("sessionUser", user2);
			
			return "0";
		}else {
			return "1";
		}
	}
	@ResponseBody
    @RequestMapping(value = "/stuspage.do",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public Object dataJson(@RequestBody JSONObject jsonFactory){
		System.out.println(jsonFactory);

		String string = jsonFactory.getString("offset");
		String string2 = jsonFactory.getString("limit");
		String search = jsonFactory.getString("search");
		String order = jsonFactory.getString("order");
		int findlike = stu.findlike(search);
		int offset = Integer.parseInt(string);
		int pageCount = Integer.parseInt(string2);
		List<Student> list = stu.findLimit(offset, pageCount,search,order);
		PageBean<Student> page = new PageBean<>();
		page.setTotal(findlike);
		page.setRows(list);
		return page;
    }
	@RequestMapping("/addStudent.do")
	public String addStudent(Student student) {
		Calendar calendar = Calendar.getInstance();
		   SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		   String currentTime = formatDate.format(calendar.getTime());
		   
		   try {
			Date today = formatDate.parse(currentTime);
			Date brithDay = formatDate.parse(student.getBirthday());
			int i =today.getYear() - brithDay.getYear();
			student.setSage(i);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		stu.addStudent(student);
		
		return "student";
	}
	@RequestMapping("/modifyStudent.do")
	public String modifyStudent(Student student) {
		Calendar calendar = Calendar.getInstance();
		   SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		   String currentTime = formatDate.format(calendar.getTime());
		   
		   try {
			Date today = formatDate.parse(currentTime);
			Date brithDay = formatDate.parse(student.getBirthday());
			int i =today.getYear() - brithDay.getYear();
			student.setSage(i);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		//System.out.println(student.getSage());
		stu.modifyStudent(student);
		
		return "student";
	}
	@RequestMapping("removeStudent.do")
	public String removeStudent(Student student) {
		stu.removeStudent(student);
		//int i = 0;
		return "student";
	}
	//修改密码
	@RequestMapping("/modifypassword.do")
    @ResponseBody
	public String modifypassword(Users user,String newpassword,String repassword){
		Users byId = service.findById(user);
		String password = byId.getPassword();
		if(password.equals(user.getPassword())){
			if (newpassword!=""){
                if(newpassword.equals(repassword)){
                    user.setPassword(newpassword);
                    service.modifypassword(user);
                    return "0";
                }else {
                    return "2";
                }
            }else {
                return "3";
            }

		}else {
			return "1";
		}

	}
	
}
