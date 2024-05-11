package Employee.admin.repository;

import java.util.ArrayList;
import java.util.List;

import Employee.admin.DBConfig.DbConfig;
import Employee.admin.model.EmployeeModel;

public class EmployeeRepositoryImpl extends DbConfig implements EmployeeRepository {
	List<Object[]> list;
	List<Object[]> li;

	// ---------------------------logic for get maximum id of employee-----------------------------
	private int id;

	public int getId() {
		try {
			stmt = conn.prepareStatement("select max(emp_id) from employee");
			rs = stmt.executeQuery();
			if (rs.next()) {
				id = rs.getInt(1);
			}
			return ++id;
		}

		catch (Exception ex) {
			System.out.println("Error is-->" + ex);
			return 0;
		}
	}

	// ----------------------------------logic for take department id by using dapartment name---------------------------
	public int getDepartmentid(String name) {
		try {

			stmt = conn.prepareStatement("select dept_id from Department where dept_name=?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return -1;
			}

		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return 0;
		}
	}

	// --------------logic for check employee already present or not----------------------------------
	public boolean isEmployeePresent(String email, String contact) {
		try {
			stmt = conn.prepareStatement("select *from employee where email=? and contact=?");
			stmt.setString(1, email);
			stmt.setString(2, contact);
			rs = stmt.executeQuery();
			return rs.next() ? true : false;

		} catch (Exception ex) {
			System.out.println("Error is-->" + ex);
			return false;
		}
	}

	// ----------------here insert employee detail--------------------------------------------------------

	public boolean isAddEmployee(EmployeeModel emodel, String name) {

		try {
			int eid = this.getId();
			if (eid != 0) {
				stmt = conn.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?)");
				stmt.setInt(1, eid);
				stmt.setString(2, emodel.getName());
				stmt.setString(3, emodel.getSurname());
				stmt.setString(4, emodel.getEmail());
				stmt.setString(5, emodel.getContact());
				stmt.setString(6, emodel.getDate());
				stmt.setInt(7, emodel.getSal());
				stmt.setString(8, emodel.getAddress());

				int value = stmt.executeUpdate();// 1
				if (value > 0) {
					int did = this.getDepartmentid(name);
					if (did != -1) {
						// ........insert value in employee and department join-.......................
						stmt = conn.prepareStatement("insert into empdptjoin values(?,?)");
						stmt.setInt(1, eid);
						stmt.setInt(2, did);
						return stmt.executeUpdate() > 0 ? true : false;
					} else if (did == -1) {
						System.out.println("department not found");
						return false;
					} else {
						System.out.println("Some problem there.......");
						return false;
					}

				} else {
					return false;
				}
			}

		} catch (Exception ex) {
			System.out.println("Error is -->" + ex);
			return false;
		}
		return false;

	}

//--------------------here we fetch all data from employee and department object through the object------------------------------------------------------------------------------
	@Override
	public List<Object[]> getAllEmployee() {
		try {
			list = new ArrayList<Object[]>();
			stmt = conn.prepareStatement(
					" SELECT e.emp_fname, e.lname, e.email, e.salary, d.dept_name, e.emp_id, e.contact, e.address FROM employee e left JOIN empdptjoin eej ON eej.emp_id = e.emp_id left JOIN department d ON eej.dept_id = d.dept_id;");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Object[] obj = new Object[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8) };
				list.add(obj);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return null;
		}

	}

//-------------------------logic for delete employee------------------------------------------
	@Override
	public boolean isDeleteEmployee(int id) {
		try {
			stmt = conn.prepareStatement("delete from employee where emp_id=?");
			stmt.setInt(1, id);
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return false;
		}

	}

//------------------------------here update all detail of employee --------------------------------------------
	@Override
	public boolean isUpdateEmp(EmployeeModel emodel) {
		try {
			stmt = conn.prepareStatement(
					"update employee set emp_fname=?,lname=?,email=?,contact=?,address=?,salary=? where emp_id=?");
			stmt.setString(1, emodel.getName());
			stmt.setString(2, emodel.getSurname());
			stmt.setString(3, emodel.getEmail());
			stmt.setString(4, emodel.getContact());
			stmt.setString(5, emodel.getAddress());
			stmt.setInt(6, emodel.getSal());
			stmt.setInt(7, emodel.getId());
			int val = stmt.executeUpdate();
			return val > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("Error is==>" + ex);
			return false;
		}
	}

//--------------------logic for serching employee using AJAX---------------------------------------------
	@Override
	public List<Object[]> getAllSearchEmployee(String searchValue) {
		try {

			List<Object[]> li = new ArrayList<Object[]>();
			stmt = conn.prepareStatement(
					" SELECT e.emp_fname, e.lname, e.email, e.salary, d.dept_name, e.emp_id, e.contact, e.address FROM employee e INNER JOIN empdptjoin eej ON eej.emp_id = e.emp_id INNER JOIN department d ON eej.dept_id = d.dept_id where e.emp_fname like '"
							+ searchValue + "%'");

			rs = stmt.executeQuery();
			while (rs.next()) {
				Object[] obj = new Object[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8) };
				li.add(obj);
			}

			return li.size() > 0 ? li : null;
		} catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return null;
		}

	}

}
