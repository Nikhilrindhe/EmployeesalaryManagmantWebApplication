package Employee.admin.repository;
import java.util.*;

import Employee.admin.model.DepartmentModel;

public interface DepartmentRepository {
	public boolean isAddDepartment(String name);
	public List<DepartmentModel> getallDepartment();
	public boolean isDeleteDepartment(int id);
	public boolean isUpdateDepartment(DepartmentModel dmodel);
}
