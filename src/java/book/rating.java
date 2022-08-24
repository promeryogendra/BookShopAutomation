package book;
public class rating
{
	private String isbn;
	private int rating;
	private String user;
	private String description;

	public rating(String isbn,int rating,String description, String user) {
		this.isbn = isbn;
		this.rating = rating;
		this.user=user;
		this.description = description;
	}

	public String getuser() {
		return user;
	}

	public void setser(String user) {
		this.user = user;
	}

	public String getisbn() {
		return isbn;
	}

	public void setisbn(String isbn) {
		this.isbn = isbn;
	}

	public int getrating() {
		return rating;
	}

	public void setrating(int rating) {
		this.rating = rating;
	}

	public String getdescription() {
		return description;
	}

	public void setdescription(String description) {
		this.description = description;
	}

	public String tostring() {
		return "rating{" + "isbn=" + isbn + ", rating=" + rating + ", user=" + user + ", description=" + description + '}';
	}

	
}
