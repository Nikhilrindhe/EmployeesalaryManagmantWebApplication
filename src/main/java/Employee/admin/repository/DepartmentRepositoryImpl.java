package Employee.admin.repository;

import java.util.ArrayList;
import java.util.List;

import Employee.admin.DBConfig.DbConfig;
import Employee.admin.model.DepartmentModel;

public class DepartmentRepositoryImpl extends DbConfig implements DepartmentRepository{
	List<DepartmentModel>list;
private int id=0;
	public int getId()
	{
		try {
			stmt=conn.prepareStatement("select max(dept_id) from department");
			rs=stmt.executeQuery();
			if(rs.next())
			{
				id=rs.getInt(1);
			}
			return ++id;
		}
		catch(Exception ex)
		{
			System.out.println("Error is==>"+ex);
			return -1;
		}
	}
	@Override
	public boolean isAddDepartment(String name) {
		try {
			int did=this.getId();
			if(did!=0)
			{
				stmt=conn.prepareStatement("insert into department values (?,?)");
				stmt.setInt(1, did);
				stmt.setString(2, name);
				int val=stmt.executeUpdate();
				if(val!=0)
				{
					return true;
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
			
			
		}
		catch(Exception ex)
		{
			System.out.println("Error is==>"+ex);
			return false;
		}
		
	}
	@Override
	public List<DepartmentModel> getallDepartment() {
		try
		{
			list=new ArrayList<DepartmentModel>();
			stmt=conn.prepareStatement("select *from department");
			rs=stmt.executeQuery();
			while(rs.next())
			{
				DepartmentModel model=new DepartmentModel();
				model.setDept_id(rs.getInt(1));
				model.setDept_name(rs.getString(2));
				list.add(model);
			}
			return list.size()>0?list:null;
		}
		catch(Exception ex)
		{
			System.out.println("Error is:"+ex);
			return null;
		}
		
	}
	@Override
	public boolean isDeleteDepartment(int id) {
		try {
			stmt=conn.prepareStatement("delete from department where dept_id=?");
			stmt.setInt(1, id);
			int val=stmt.executeUpdate();
			return val>0?true:false;
		}
		catch(Exception ex)
		{
			System.out.println("Error is==>"+ex);
			return false;
		}
		
	}
	@Override
	public boolean isUpdateDepartment(DepartmentModel dmodel) {
		try {
			stmt=conn.prepareStatement("update department set dept_name=? where dept_id=?");
			stmt.setString(1, dmodel.getDept_name());
			stmt.setInt(2,dmodel.getDept_id());
			int val=stmt.executeUpdate();
			return val>0?true:false;
		}
		catch(Exception ex)
		{
			System.out.println("Error is==>"+ex);
			return false;
		}
		
	}

}
