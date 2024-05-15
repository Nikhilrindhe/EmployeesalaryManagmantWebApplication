package Employee.admin.service;

import java.util.List;
import Employee.admin.repository.*;

public class SalaryServiceImpl implements SalaryService{
	SalaryRepository srepo=new SalaryRepositoryImpl();
	

	@Override
	public List<Object[]> empSerchByEmail(String searchValue,String monthValue) {
		return srepo.empSerchByEmail(searchValue,monthValue);
	}
	
}
