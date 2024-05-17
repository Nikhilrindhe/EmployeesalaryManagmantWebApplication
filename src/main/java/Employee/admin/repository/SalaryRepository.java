package Employee.admin.repository;

import java.util.List;

import Employee.admin.model.EmployeSalaryModel;

public interface SalaryRepository {
	public List<EmployeSalaryModel> empSerchByEmail(String searchValue,String monthValue);

}
