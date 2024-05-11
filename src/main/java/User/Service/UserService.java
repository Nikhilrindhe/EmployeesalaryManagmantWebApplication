package User.Service;

import Employee.admin.model.EmployeeModel;

public interface UserService {
	public int isVerifyEmployee(String user,String pass);
	public EmployeeModel viewProfile(int eid);
}
