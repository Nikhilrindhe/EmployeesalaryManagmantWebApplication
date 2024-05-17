package Employee.admin.service;

import java.util.List;

import Employee.admin.model.EmployeSalaryModel;
import Employee.admin.repository.*;

public class SalaryServiceImpl implements SalaryService{
	SalaryRepository srepo=new SalaryRepositoryImpl();
	

	@Override
	public List<EmployeSalaryModel> empSerchByEmail(String searchValue,String monthValue) {
		return srepo.empSerchByEmail(searchValue,monthValue);
	}
	
}
