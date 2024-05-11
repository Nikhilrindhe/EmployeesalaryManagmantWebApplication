package User.Service;

import Employee.admin.model.EmployeeModel;
import User.Repository.*;

public class UserServiceImpl implements UserService {
	UserRepository urepo=new UserRepositoryImpl();
	@Override
	public int isVerifyEmployee(String user, String pass) {
		return urepo.isVerifyEmployee(user, pass);
	}
	@Override
	public EmployeeModel viewProfile(int eid) {
		
		return urepo.viewProfile(eid);
	}

}
