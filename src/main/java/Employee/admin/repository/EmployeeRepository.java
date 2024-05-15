package Employee.admin.repository;

import java.util.List;

import Employee.admin.model.EmployeeModel;

public interface EmployeeRepository {
	public boolean isEmployeePresent(String username,String password);
	public boolean isAddEmployee(EmployeeModel emodel,String name);
	public List<Object[]> getAllEmployee();
	public boolean isDeleteEmployee(int id);
	public boolean isUpdateEmp(EmployeeModel emodel);
	public List<Object[]> getAllSearchEmployee(String searchValue);

}
