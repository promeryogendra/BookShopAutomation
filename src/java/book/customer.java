package book;
public class customer 
{
	private String name,pass,fullname,gmail,phoneno;
	private int age;

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getpass() {
		return pass;
	}

	public void setpass(String pass) {
		this.pass = pass;
	}

	public String getfullname() {
		return fullname;
	}

	public void setfullname(String fullname) {
		this.fullname = fullname;
	}

	public String getgmail() {
		return gmail;
	}

	public void setgmail(String gmail) {
		this.gmail = gmail;
	}

	public String getphoneno() {
		return phoneno;
	}

	public void setphoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public int getage() {
		return age;
	}

	public void setage(int age) {
		this.age = age;
	}
	
	public customer(String name, String pass, String fullname, String gmail, int age ,String phoneno) {
		this.name = name;
		this.pass = pass;
		this.fullname = fullname;
		this.gmail = gmail;
		this.phoneno = phoneno;
		this.age = age;
	}

	public String tostring() {
		return "customer{" + "name=" + name + ", pass=" + pass + ", fullname=" + fullname + ", gmail=" + gmail + ", phoneno=" + phoneno + ", age=" + age + '}';
	}
	
	
}
