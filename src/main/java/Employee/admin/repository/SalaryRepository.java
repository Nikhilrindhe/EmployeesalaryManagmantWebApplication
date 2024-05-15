package Employee.admin.repository;

import java.util.List;

public interface SalaryRepository {
	public List<Object[]> empSerchByEmail(String searchValue,String monthValue);

}
