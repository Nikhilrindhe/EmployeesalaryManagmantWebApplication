package Employee.admin.service;

import java.util.List;

import Employee.admin.model.EmployeSalaryModel;

public interface SalaryService {
	public List<EmployeSalaryModel> empSerchByEmail(String searchValue,String monthValue);
	

}
