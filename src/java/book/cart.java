package book;
public class cart {
	private String name;
	private String isbn;


	public String getname() {
		return name;
	}

	public void sename(String name) {
		this.name = name;
	}

	public String getisbn() {
		return isbn;
	}

	public void setisbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String tostring() {
		return "cart{" + "name=" + name + ", isbn=" + isbn + '}';
	}
}
