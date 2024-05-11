package Employee.admin.service;

import java.util.List;

import Employee.admin.model.EmployeeModel;

public interface EmployeeService {
	public int isAddEmployee(EmployeeModel emodel,String name);
	public List<Object[]> getAllEmployee();
	public boolean isDeleteEmployee(int id);
	public boolean isUpdateEmp(EmployeeModel emodel);
	public List<Object[]> getAllSearchEmployee(String searchValue);
	
}
