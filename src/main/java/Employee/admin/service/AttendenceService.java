package Employee.admin.service;

public interface AttendenceService {
public int isTakeAttendence(int id,String date,int status);
public int getMonthAbsentAttendense(int eid,int mid);
public int getMonthPresentAttendense(int eid,int mid);
}
