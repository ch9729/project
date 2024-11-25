package dto;

import java.time.LocalTime;

public class RentalDTO {
	
	private int rentalNum;
	private int userNum;
	private int bnum;
	private BookDTO book;
	public BookDTO getBook() {
		return book;
	}
	public void setBook(BookDTO book) {
		this.book = book;
	}
	private LocalTime rentalStart;	//대여일
	private LocalTime rentalEnd;	//반납 예정일
	private LocalTime returnDate;	//반납일
	
	
	public int getRentalNum() {
		return rentalNum;
	}
	public void setRentalNum(int rentalNum) {
		this.rentalNum = rentalNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public LocalTime getRentalStart() {
		return rentalStart;
	}
	public void setRentalStart(LocalTime rentalStart) {
		this.rentalStart = rentalStart;
	}
	public LocalTime getRentalEnd() {
		return rentalEnd;
	}
	public void setRentalEnd(LocalTime rentalEnd) {
		this.rentalEnd = rentalEnd;
	}
	public LocalTime getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(LocalTime returnDate) {
		this.returnDate = returnDate;
	}
	
}
