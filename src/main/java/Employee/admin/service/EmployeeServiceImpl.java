package Employee.admin.service;

import java.util.List;

import Employee.admin.model.EmployeeModel;
import Employee.admin.repository.*;

public class EmployeeServiceImpl implements EmployeeService{
	EmployeeRepository erepo=new EmployeeRepositoryImpl();
	@Override
	public int isAddEmployee(EmployeeModel emodel,String name) {
		return erepo.isEmployeePresent(emodel.getEmail(), emodel.getContact())?-1:erepo.isAddEmployee(emodel, name)?1:0;
		
	}
	@Override
	public List<Object[]> getAllEmployee() {
		
		return erepo.getAllEmployee();
	}
	@Override
	public boolean isDeleteEmployee(int id) {
		return erepo.isDeleteEmployee(id);
	}
	@Override
	public boolean isUpdateEmp(EmployeeModel emodel) {
		
		return erepo.isUpdateEmp(emodel);
	}
	@Override
	public List<Object[]> getAllSearchEmployee(String searchValue) {
		return erepo.getAllSearchEmployee(searchValue);
	}

}
