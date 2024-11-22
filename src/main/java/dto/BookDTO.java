package dto;

public class BookDTO {
	private int bnum;
	private String bname;
	private String bdetail;
	private int age;
	private int booking_yn;

	public int getBooking_yn() {
		return booking_yn;
	}
	public void setBooking_yn(int booking_yn) {
		this.booking_yn = booking_yn;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBdetail() {
		return bdetail;
	}
	public void setBdetail(String bdetail) {
		this.bdetail = bdetail;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
