
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 19/11/2022
 */
package PhoneBook;


import java.util.Deque;
import java.util.Scanner;
import java.util.ArrayDeque;
import java.util.InputMismatchException;

public class PhoneBookDemo {
    // simple method to display the menu and guide user in how to search
	public static void menu() {
		System.out.println("Welcome here is the menu:");
		System.out.println("1_ for exit");
		System.out.println("2_ for search");
	}
	public static void main(String[] args) {
            // initializing Deque and inserting values to it.
		Deque <PhoneBook> deque = new ArrayDeque<PhoneBook>();
		deque.offer(new PhoneBook(1,"Pandafter UMT","096684342"));
		deque.offer(new PhoneBook(2,"Jabatan Pengurusan Akademi UMT","096684219"));
		deque.offer(new PhoneBook(3,"Fakulti Teknologi Kejuruteraan Kelautan dan Informatik","096683220"));
		
                // initializing scanners to get user input(Integer, String)
		Scanner in = new Scanner(System.in);
		Scanner inString = new Scanner(System.in);
		
                // initializing the variables that would be used for searching in 'phonebook'
		String answerInString = "";
		boolean check = true;
		int answer = 0 ,count = 0;
                
                // try to confirm of user input (Integer only)
                try{
		while(check) {
			menu();
			answer = in.nextInt();
                        
			switch(answer) {
			case 1:  // if input is 1 terminate the program
				check = false;
				break;
			case 2: // if 2 do the searching
                                
				answerInString = "";
				System.out.print("Please enter Name to search:");
				answerInString = inString.nextLine();
                                count = 0; // to see if search values is found(would be used later)
                                System.out.println("-----------------------------------------");
				for(PhoneBook e: deque) {
                                /* here we are converting(temporarily) the user input and the values in the 
                                    phonebook to lowercase efficient search and then comparing the values*/
					if(e.getName().toLowerCase().contains(answerInString.toLowerCase()) &&
                                   // although we have spaces in our phonebook list but it won't accept that
                                                (!answerInString.isBlank())) { 
						System.out.println(e);
                                                count++;
					}
				}
                                // if the input is just empty string or no value is found
				if(answerInString.isBlank() || count ==0) {
					System.out.println("Sorry we could not find what u looking for...");
                                        System.out.println("-----------------------------------------");
				}
                                System.out.println("-----------------------------------------\n\n");
				break;
			default:
				System.out.println("Invalid input?");
			}
                        
		}
		System.out.println("Thank you for using our Program...");
                //terminate  the program if the input is not Integer
                }catch(InputMismatchException n){
                            System.out.println("-----------------------------------------");
                            System.out.println("Please Enter a Number !!!");
                            
                            System.out.println("-----------------------------------------\n\n");
                        }
	}
}

