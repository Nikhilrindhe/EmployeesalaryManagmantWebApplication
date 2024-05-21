package Employee.admin.repository;

public interface AttendenceRepository{
	public boolean isTakeAttendence(int id,String date,int status);
	public boolean isVerifyAttendence(int id,String date,int status);
	public int getMonthPresentAttendense(int eid, int mid);
	public int getMonthAbsentAttendense(int eid, int mid);
}
