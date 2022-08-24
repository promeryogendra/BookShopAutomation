package book;
public class book {
	private String isbn;
	private String bname;
	private String bauthor;
	private int bcost;
	private String bsubject;
	private int bcount;
	private String bimage;
	public book(String isbn, String bname, String bauthor, int bcost, String bsubject, int bcount, String bimage) {
		this.isbn = isbn;
		this.bname = bname;
		this.bauthor = bauthor;
		this.bcost = bcost;
		this.bsubject = bsubject;
		this.bcount = bcount;
		this.bimage = bimage;
	}
	
	public String getisbn() {
		return isbn;
	}

	public void setisbn(String isbn) {
		this.isbn = isbn;
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

	public int getbcost() {
		return bcost;
	}

	public void setbcost(int bcost) {
		this.bcost = bcost;
	}

	public String getbsubject() {
		return bsubject;
	}

	public void setbsubject(String bsubject) {
		this.bsubject = bsubject;
	}

	public int getbcount() {
		return bcount;
	}

	public void setbcount(int bcount) {
		this.bcount = bcount;
	}

	public String getbimage() {
		return bimage;
	}

	public void setbimage(String bimage) {
		this.bimage = bimage;
	}
	
	public String tostring() {
		return "book{" + "isbn=" + isbn + ", bname=" + bname + ", bauthor=" + bauthor + ", bcost=" + bcost + ", bsubject=" + bsubject + ", bcount=" + bcount + ", bimage=" + bimage + '}';
	}
	
}
