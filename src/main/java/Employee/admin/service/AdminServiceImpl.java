package Employee.admin.service;

import Employee.admin.repository.*;

public class AdminServiceImpl implements AdminService{
	AdimnRepository arepo=new AdminRepositoryImpl();
	@Override
	public boolean isVarifyAdmin(String name, String pass) {
		return arepo.isVarifyAdmin(name, pass);
	}

}
