package book;
public class requestbook
{
	private String bname;
	private String bauthor;
	private String bsubject;
	private String name;

	
	public requestbook(String bname, String bauthor, String bsubject, String name) {
		this.bname = bname;
		this.bauthor = bauthor;
		this.bsubject = bsubject;
		this.name = name;
	}
	
	public String getbname() {
		return bname;
	}

	public void setbname(String bname) {
		this.bname = bname;
	}

	public String getbauthor() {
		return bauthor;
	}

	public void setbauthor(String bauthor) {
		this.bauthor = bauthor;
	}

	public String getbsubject() {
		return bsubject;
	}

	public void setbsubject(String bsubject) {
		this.bsubject = bsubject;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String tostring() {
		return "requestbook{" + "bname=" + bname + ", bauthor=" + bauthor + ", bsubject=" + bsubject + ", name=" + name + '}';
	}
	
	
}
