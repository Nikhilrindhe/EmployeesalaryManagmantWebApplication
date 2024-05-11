package Employee.admin.service;

import Employee.admin.repository.AttendenceRepository;
import Employee.admin.repository.AttendenceRepositoryImpl;

public class AttendenceServiceImpl implements AttendenceService{
		AttendenceRepository arepo=new AttendenceRepositoryImpl();
	@Override
	public int isTakeAttendence(int id, String date, int status) {
		
		return arepo.isVerifyAttendence(id, date, status)?-1:arepo.isTakeAttendence(id, date, status)?1:0;
		
	}

}
