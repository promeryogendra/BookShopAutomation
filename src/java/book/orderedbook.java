package book;
public class orderedbook 
{
	private String name;
	private String bname;
	private String isbn;
	private int cost;
	private String date;
	private int count;
	private String status;
	private String bimage;
	private String address;
	private String phone;
	private String view;
	private int id;
	public orderedbook(String name, String bname, String isbn, int cost, String date, int count, String status, String bimage, String address, String phone,String view,int id) {
		this.name = name;
		this.bname = bname;
		this.isbn = isbn;
		this.cost = cost;
		this.date = date;
		this.count = count;
		this.status = status;
		this.bimage = bimage;
		this.address = address;
		this.phone = phone;
		this.id=id;
		this.view=view;
	}
	

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}
	public String getview() {
		return view;
	}

	public void setview(String view) {
		this.view = view;
	}

	
	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getbname() {
		return bname;
	}

	public void setbname(String bname) {
		this.bname = bname;
	}

	public String getisbn() {
		return isbn;
	}

	public void setisbn(String isbn) {
		this.isbn = isbn;
	}

	public int getcost() {
		return cost;
	}

	public void setcost(int cost) {
		this.cost = cost;
	}

	public String getdate() {
		return date;
	}

	public void setdate(String date) {
		this.date = date;
	}

	public int getcount() {
		return count;
	}

	public void setcount(int count) {
		this.count = count;
	}

	public String getstatus() {
		return status;
	}

	public void setstatus(String status) {
		this.status = status;
	}

	public String getbimage() {
		return bimage;
	}

	public void setbimage(String bimage) {
		this.bimage = bimage;
	}

	public String getaddress() {
		return address;
	}

	public void setaddress(String address) {
		this.address = address;
	}

	public String getphone() {
		return phone;
	}

	public void setphone(String phone) {
		this.phone = phone;
	}

	public String tostring() {
		return "orderedbook{" + "name=" + name + ", bname=" + bname + ", isbn=" + isbn + ", cost=" + cost + ", date=" + date + ", count=" + count + ", status=" + status + ", bimage=" + bimage + ", address=" + address + ", phone=" + phone +", view=" +view+", id=" +id+'}';
	}
}
