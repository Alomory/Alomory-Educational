    package Task3;

import java.util.Scanner;

/**
 * @author Omar Alomory Program: SMSK(KMA) K2 Course: CSF3013 Lab: MP3 Date:
 * 19/11/2022
 */
public class BinaryStackTest {

    public static void main(String[] args) {
        // the size of the stack is 25
        BinaryStack s = new BinaryStack(25);
        // getting user input
        Scanner scanInput = new Scanner(System.in);
        System.out.println("Please Enter a Binary Number:");
        


        String decNumber = "";

        decNumber = scanInput.next();

        int count = 0;
        while (true) {
            // tracking count if it reach the length of the String then it will
            // break the loop
            if (count == decNumber.length()) {
                break;
            }
            // if the input value is not 1 or 0 then error will be thrown.
            if (!(decNumber.charAt(count) == '1' || decNumber.charAt(count) == '0')) {
                System.out.println("Invalid input...\n"
                        + "Please Enter a Binary Number to Convert to Decimal:");
                count = 0;
                decNumber = scanInput.next();// input from user
            }
            count++;
        }
        // pushing values to the stack 
        for (int j = 0; j < decNumber.length(); j++) {
            s.push(Integer.parseInt(String.valueOf(decNumber.charAt(j))));
        }
        int sizeOfStack = s.length();
        int answer = 0;
        // poping values from stack
        while (!s.isEmpty()) {
            answer += Math.pow(2, sizeOfStack - s.length()) * s.pop();
        }
        System.out.println("The Decimal form of [" + decNumber + "] is [" + answer + "]");
    }
}
