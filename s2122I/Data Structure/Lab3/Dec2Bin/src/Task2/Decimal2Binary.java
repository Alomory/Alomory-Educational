package Task2;

import java.util.Scanner;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 19/11/2022
 */
public class Decimal2Binary {

    public static void main(String[] args) {
        IntStack s = new IntStack(25);

        Scanner scanInput = new Scanner(System.in);

        boolean check = true;
        int decNumber = 0;
        // if user input non integer values, exception will be thrown.
        while (check) {
            try {
                System.out.println("Please Enter a Number:");
                decNumber = Integer.parseInt(scanInput.nextLine());
                check = false;
            } catch (NumberFormatException n) {
                System.out.println("-----------------------------\n"
                                 + "This input is invaild!!!\n"
                        + "-----------------------------");;
            }
        }

        boolean stop = false;
        while (!stop) {
            if (!s.isFull()) {
                s.push(decNumber % 2);
            }

            decNumber = decNumber / 2;
            if (decNumber == 0 || decNumber == 1) {
                if (!s.isFull()) {
                    s.push(decNumber);
                }
                stop = true;
            }
        }
        while (!s.isEmpty()) {
            System.out.print(s.pop() + " ");
        }
        System.out.println("\n");

    }
}
