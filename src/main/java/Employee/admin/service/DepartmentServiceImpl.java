package Employee.admin.service;

import java.util.List;

import Employee.admin.model.DepartmentModel;
import Employee.admin.repository.DepartmentRepository;
import Employee.admin.repository.DepartmentRepositoryImpl;

public class DepartmentServiceImpl implements DepartmentService{
DepartmentRepository drepo=new DepartmentRepositoryImpl();
	@Override
	public boolean isAddDepartment(String name) {
		return drepo.isAddDepartment(name);
	}
	@Override
	public List<DepartmentModel> getallDepartment() {
		
		return drepo.getallDepartment();
	}
	@Override
	public boolean isDeleteDepartment(int id) {
	
		return drepo.isDeleteDepartment(id);
	}
	@Override
	public boolean isUpdateDepartment(DepartmentModel dmodel) {
		
		return drepo.isUpdateDepartment(dmodel);
	}

}
