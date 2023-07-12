
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 29/11/2022
 */
package PhoneBook;

public class PhoneBook {
	
	private int Id;
	private String name;
	private String phoneNo;
	
	public PhoneBook() {}
	public PhoneBook(int id, String name, String phoneNo) {
		this.Id=id;
		this.name = name;
		this.phoneNo = phoneNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String toString() {
		return this.name+": "+this.phoneNo;
	}
}


