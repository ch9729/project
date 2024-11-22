package dto;

import java.time.LocalTime;

public class Rantal {
	
	private int rantalNum;
	private int userNum;
	private int bnum;
	private LocalTime rantalStart;	//대여일
	private LocalTime rantalEnd;	//반납 예정일
	private LocalTime returnDate;	//반납일
	
	
	public int getRantalNum() {
		return rantalNum;
	}
	public void setRantalNum(int rantalNum) {
		this.rantalNum = rantalNum;
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
	public LocalTime getRantalStart() {
		return rantalStart;
	}
	public void setRantalStart(LocalTime rantalStart) {
		this.rantalStart = rantalStart;
	}
	public LocalTime getRantalEnd() {
		return rantalEnd;
	}
	public void setRantalEnd(LocalTime rantalEnd) {
		this.rantalEnd = rantalEnd;
	}
	public LocalTime getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(LocalTime returnDate) {
		this.returnDate = returnDate;
	}
	
}
