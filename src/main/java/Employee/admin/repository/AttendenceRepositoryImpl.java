package Employee.admin.repository;

import java.time.LocalDate;

import Employee.admin.DBConfig.DbConfig;

public class AttendenceRepositoryImpl extends DbConfig implements AttendenceRepository{
	
//------------------here we find last date id from date table using today date and employee id----------------------------------------------------------------
	private int maxdid;
	public int getDateId(int eid,String date)
	{
		
		try {
			
			stmt=conn.prepareStatement("select max(d.did) from date d inner join empattendatejoin eej on eej.did=d.did where eej.emp_id=? and d.date=?");
			stmt.setInt(1,eid);
			stmt.setString(2, date);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				maxdid=rs.getInt(1);
				
			}
		
			else
			{
				return -1;
			}
			return maxdid;
		}
		
		catch(Exception ex)
		{
			System.out.println("Error in find date id==>"+ex);
			return -1;
		}
		
	}
//	-----------After verification here we find max date id from date table for insert new date id into the date table-------------------------------------------------------------------------------------------------
	private int dateId;
	public int getMaxdateId()
	{
		try {
			stmt=conn.prepareStatement("select max(did) from date");
			
			rs=stmt.executeQuery();
			if(rs.next())
			{
				dateId=rs.getInt(1);//40
				 ++dateId;
				 stmt=conn.prepareStatement("insert into date values(?,?)");
				
				 LocalDate currentDate = LocalDate.now();
					java.sql.Date sqlDate = java.sql.Date.valueOf(currentDate);
				stmt.setInt(1, dateId);
				stmt.setDate(2, sqlDate);
				int value=stmt.executeUpdate();
				if(value>0) {
					return dateId;
				}
				
				else {
					return -1;
				}
			}
			else {
				return -1;
			}
			
		
		
		}
		catch(Exception ex)
		{
			System.out.println("Error in get maximum id==>"+ex);
			return -1;
		}
		
	}
//	---------here we check employee alredy marked attendence or not if alredy marked return true otherwise false---------------

	public boolean isVerifyAttendence(int id, String date, int status) {
		try {
			int did=this.getDateId(id,date);
//			System.out.println("Date id is==>"+did);
//			System.out.println("status id is==>"+status);
//			System.out.println("date is ==>"+date);
			stmt=conn.prepareStatement("select *from empattendatejoin where emp_id=? and did=?");
			stmt.setInt(1, id);
			//stmt.setInt(2, status);
			stmt.setInt(2, did);
//			System.out.println("hii i am is verify attendence");
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
			System.out.println("Error in varify logic==>"+ex);
			return false;
		}
		
	}
	
//	-------after verification here we marked attendense------------------------------------------------------------------
	
	
	public boolean isTakeAttendence(int id, String date, int status) {
		try
		{
			
			int did=this.getMaxdateId();
			if(did>0)
			{
			stmt=conn.prepareStatement("insert into  empattendatejoin values(?,?,?)");
			stmt.setInt(1, id);
			stmt.setInt(2, status);
			stmt.setInt(3, did);
			int val=stmt.executeUpdate();
			if(val>0)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		}
			else
			{
				return false;
			}
		
	}
		catch(Exception ex)
		{
			System.out.println("Error in take attendence:"+ex);
			return false;
		}	
	}
}
