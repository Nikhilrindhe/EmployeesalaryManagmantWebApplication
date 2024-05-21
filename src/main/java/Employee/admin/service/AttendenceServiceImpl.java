package Employee.admin.service;

import Employee.admin.repository.AttendenceRepository;
import Employee.admin.repository.AttendenceRepositoryImpl;

public class AttendenceServiceImpl implements AttendenceService{
		AttendenceRepository arepo=new AttendenceRepositoryImpl();
	@Override
	public int isTakeAttendence(int id, String date, int status) {
		
		return arepo.isVerifyAttendence(id, date, status)?-1:arepo.isTakeAttendence(id, date, status)?1:0;
		
	}
	@Override
	public int getMonthPresentAttendense(int eid, int mid) {
		return arepo.getMonthPresentAttendense(eid,mid);
	}

	public int getMonthAbsentAttendense(int eid, int mid) {
		return arepo.getMonthAbsentAttendense(eid,mid);
	}
}
