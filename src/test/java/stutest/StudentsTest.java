package stutest;

import model.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.StudentService;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class StudentsTest {
    @Autowired
    StudentService stu;
    @Test
    public void stutest(){
        int i = stu.findlike("");
        System.out.print(i);

    }
    @Test
    public void stutestlimit(){
        for (Student asc : stu.findLimit(0, 4, "", "desc")) {
            System.out.print(asc);
        }
    }
    @Test
    public void test1(){
        String a = "一";
        String b = "一";
        System.out.print(a==b);

    }
}
