package nutrizen.backend.register;

public class UserRegister {

	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String password;
	private int id; 
	private int total = 0;
	
	public UserRegister(String firstName, String lastName, String email, String phone, String password) {
		super();
		total++; 
		this.id = total;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}//constructorUserRegister

	public String getFirstName() {
		return firstName;
	}//getFirstName

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}//setFirstName

	public String getLastName() {
		return lastName;
	}//getLastName

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}//setLastName

	public String getEmail() {
		return email;
	}//getEmail

	public void setEmail(String email) {
		this.email = email;
	}//setEmail

	public String getPhone() {
		return phone;
	}//getPhone

	public void setPhone(String phone) {
		this.phone = phone;
	}//setPhone

	public String getPassword() {
		return password;
	}//getpassword

	public void setPassword(String password) {
		this.password = password;
	}//setpassword

	public int getId() {
		return id;
	}//getid
	
	

}
