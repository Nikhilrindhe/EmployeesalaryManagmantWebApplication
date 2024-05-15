package Employee.admin.repository;

import java.util.ArrayList;
import java.util.List;

import Employee.admin.DBConfig.DbConfig;

public class SalaryRepositoryImpl extends DbConfig implements SalaryRepository{
	
	public List<Object[]> empSerchByEmail(String searchValue,String monthValue) {
		try {
		
			
			List<Object[]> l = new ArrayList<Object[]>();
			stmt = conn.prepareStatement(
					" SELECT e.emp_fname, e.lname, e.email, e.salary, d.dept_name, e.emp_id, e.contact, e.address FROM employee e LEFT JOIN empdptjoin eej ON eej.emp_id = e.emp_id LEFT JOIN department d ON eej.dept_id = d.dept_id where e.email like ?");
			 stmt.setString(1, "%" + searchValue + "%");
			

			stmt.setString(1,searchValue);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Object[] obj = new Object[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)};
				l.add(obj);
			}
			System.out.println(l.size());
			return l.size() > 0 ? l : null;
		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return null;
		}

	}

}
