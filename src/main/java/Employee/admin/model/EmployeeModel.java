package Employee.admin.model;

public class EmployeeModel {
private String name;
private String surname;
private String email;
private String contact;
private String date;
private String address;
private int sal;
private int id;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSurname() {
	return surname;
}
public void setSurname(String surname) {
	this.surname = surname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getSal() {
	return sal;
}
public void setSal(int sal) {
	this.sal = sal;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public EmployeeModel(String name,String surname,String email,String contact,String date,String address,int sal)
{
	this.name=name;
	this.surname=surname;
	this.email=email;
	this.contact=contact;
	this.date=date;
	this.address=address;
	this.sal=sal;	//
}
public EmployeeModel()
{
	
}
}
