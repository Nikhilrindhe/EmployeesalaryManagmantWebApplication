package User.Repository;

import Employee.admin.model.EmployeeModel;

public interface UserRepository {
	public int isVerifyEmployee(String user, String pass);
	public EmployeeModel viewProfile(int eid);
}
