package Employee.admin.repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Employee.admin.DBConfig.DbConfig;
import Employee.admin.model.EmployeSalaryModel;
import Employee.admin.model.EmployeeModel;

public class SalaryRepositoryImpl extends DbConfig implements SalaryRepository{
	
	
	public double da,pf,hra,pt,gs,ad,netsalary;
	List<EmployeSalaryModel> l=null;
	//=======================Serch Employee By email================================================
	private int eid=0;
	public int getempid(String searchValue)
	{		
		try {			
			stmt=conn.prepareStatement("select emp_id from employee where email=?");
			stmt.setString(1, searchValue);
			rs=stmt.executeQuery();			
			if(rs.next())
			{
				eid=rs.getInt(1);						
			}
		}
		catch(Exception ex)
		{
			System.out.println("Error is-->"+ex);
			return 0;
		}
		return eid;
	}
	
	//====================Serch emploee by email =========================================================================================
	
	public List<EmployeSalaryModel> empSerchByEmail(String searchValue,String monthValue) {
		try {
			
			Object[] obj=null;
			 Object[] salaryDetails=null;
			l = new ArrayList<EmployeSalaryModel>();
			stmt = conn.prepareStatement(
					" SELECT e.emp_fname, e.lname, e.email, e.salary, d.dept_name, e.emp_id, e.contact, e.address FROM employee e LEFT JOIN empdptjoin eej ON eej.emp_id = e.emp_id LEFT JOIN department d ON eej.dept_id = d.dept_id where e.email like ?");
			 stmt.setString(1, "%" + searchValue + "%");
			

			stmt.setString(1,searchValue);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
			
				obj = new Object[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8)
						};
				  salaryDetails= this.SalaryService(rs.getInt(6), rs.getInt(4), monthValue);
	            
			}
			 EmployeSalaryModel esmodel=new EmployeSalaryModel();
	            esmodel.setName((String)obj[0]);
	            esmodel.setSurname((String)obj[1]);
	            esmodel.setEmail((String)obj[2]);
	            esmodel.setBasicSalary((int)obj[3]);
	            esmodel.setDeptName((String)obj[4]);
	            esmodel.setId((int)obj[5]);
	            esmodel.setDa((double)salaryDetails[0]);		//da,pf,hra,pt,gs,ad,netsalary
	            esmodel.setPf((double)salaryDetails[1]);
	            esmodel.setHra((double)salaryDetails[2]);
	            esmodel.setPt((double)salaryDetails[3]);
	            esmodel.setGs((double)salaryDetails[4]);
	            esmodel.setAd((double)salaryDetails[5]);
	            esmodel.setNetSalary((double)salaryDetails[6]);
	            l.add(esmodel);
			return l.size()>0 ? l : null;
			
		} 
		catch (Exception ex) {
			System.out.println("Error is:" + ex);
			return null;
		}

	}
	//========================================================================================================================
	
		
	public Object[] SalaryService(int eid,int salary,String monthValue) {
		try {
		
			
			
			String substring[]=monthValue.split("-");
			int year=Integer.parseInt(substring[0]);
			int month=Integer.parseInt(substring[1]);
//			System.out.println("year is"+year+"\tMonth is"+month);
			int presentcount=this.getMonthAttendense(eid,year,month);

			int dayss=0;
			try {
				
				String sql = "SELECT DAY(LAST_DAY(CONCAT(?, '-', ?, '-01'))) AS days_in_month";
	            stmt = conn.prepareStatement(sql);
	                stmt.setInt(1, year);
	                stmt.setInt(2, month);
	                rs=stmt.executeQuery();
	                if(rs.next())
	    			{
	    				dayss=rs.getInt("days_in_month");
	    			}
			}
			catch(Exception ex)
			{
				System.out.println("Exception is==>"+ex);
			}
			
			double perdaysal=salary/dayss;
			double presentdaysal=perdaysal*presentcount;
			da=presentdaysal*10/100;				//dearence allowness
			pf=presentdaysal*0.12;     		//personal fund
			
			
//			System.out.println("before da  & pf is"+da+"\t"+pf);
			hra=presentdaysal*0.5;			//house rent
			gs=presentdaysal+da+hra;
			pt=0;
			if(salary>30000)
			{
				pt=1500;
			}
			else
			{
				pt=1000;
			}
			ad=pf+pt;						//deduction amount
			netsalary=gs-ad;     //total payble salary of month
			
			//ArrayList <Object[]>all=new ArrayList<Object[]>();
			return new Object[] {da,pf,hra,pt,gs,ad,netsalary};
			
		}
		catch(Exception ex)
		{
			System.out.println("Error is-->"+ex);
			
		}
		return null;
		
	}
	
	
	//================================here count present day of employee=========================================================================
	private int presentcount=0;
	
	public int getMonthAttendense(int eid,int year,int month)
	{
		try {
				stmt=conn.prepareStatement("SELECT COUNT(d.did) FROM employee e INNER JOIN empattendatejoin empj ON empj.emp_id = e.emp_id INNER JOIN date d ON d.did = empj.did WHERE e.emp_id = ? AND YEAR(D.DATE)=? AND MONTH(d.date) = ? AND empj.atid=1 GROUP BY e.emp_fname");
				stmt.setInt(1, eid);
				stmt.setInt(2, year);
				stmt.setInt(3,month);
				rs=stmt.executeQuery();
				if(rs.next())
				{
					 presentcount=rs.getInt(1);		
					
				}
			else
			{
				return 0;
			}
		}
			
		catch(Exception ex)
		{
			System.out.println("Error is-->"+ex);
			return 0;
		}
		return presentcount;
	}

	

}
