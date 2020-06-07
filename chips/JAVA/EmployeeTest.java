import java.io.*;
public class EmployeeTest{
	public static void main(String[] args) {
		Employee emp = new Employee("James");
		emp.empAge(26);
		emp.empDesignation("Senior Software Engineer");
		emp.empSalary(1000);
		emp.printEmployee();
	}
}