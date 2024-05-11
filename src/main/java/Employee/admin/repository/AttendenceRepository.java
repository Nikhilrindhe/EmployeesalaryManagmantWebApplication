package Employee.admin.repository;

public interface AttendenceRepository{
	public boolean isTakeAttendence(int id,String date,int status);
	public boolean isVerifyAttendence(int id,String date,int status);
}
