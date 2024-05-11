package User.Repository;

import Employee.admin.DBConfig.DbConfig;
import Employee.admin.model.EmployeeModel;

public class UserRepositoryImpl extends DbConfig implements UserRepository{
	EmployeeModel emodel=null;
	@Override
	public int isVerifyEmployee(String user, String pass) {
		try
		{
			stmt=conn.prepareStatement("select *from employee where emp_fname=? and contact=?");
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			else
			{
				return 0;
			}

		}
		catch(Exception ex)
		{
			System.out.println("Error is:"+ex);
			return 0;
		}
	}

	
	public EmployeeModel viewProfile(int eid) {
	try {
		
		stmt=conn.prepareStatement("select *from employee where emp_id=?");
		stmt.setInt(1, eid);
		rs=stmt.executeQuery();
		if(rs.next())
		{
			emodel=new EmployeeModel();
			emodel.setName(rs.getString(2));
			emodel.setSurname(rs.getString(3));
			emodel.setEmail(rs.getString(4));
			emodel.setContact(rs.getString(5));
			emodel.setDate(rs.getString(6));
			emodel.setSal(rs.getInt(7));
			emodel.setAddress(rs.getString(8));
			
		}
		return emodel;
		
	}
	catch(Exception ex)
	{
		System.out.println("Error is==>"+ex);
		return null;
	}
	}

}
