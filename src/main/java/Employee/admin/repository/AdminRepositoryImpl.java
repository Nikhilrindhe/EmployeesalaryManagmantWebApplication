package Employee.admin.repository;

import Employee.admin.DBConfig.DbConfig;

public class AdminRepositoryImpl extends DbConfig implements AdimnRepository{

	@Override
	public boolean isVarifyAdmin(String name, String pass) {
		try {
			stmt=conn.prepareStatement("select *from admin where admin_username=? and admin_password=?");
			stmt.setString(1, name);
			stmt.setString(2, pass);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				return true;
			}
			else {
				return false;
			}
		}
		catch(Exception ex)
		{
			System.out.println("Error is=>"+ex);
			return false;
		}
		
	}

}
