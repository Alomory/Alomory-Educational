
package Task1;

import java.io.IOException;
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 19/11/2022
 */
public class TestChrStack {

    public static void main(String[] args) throws IOException {

        ChrStack s = new ChrStack(100);
        char ch;
        System.out.println("Please enter your name:");
     
            while ((ch = (char) System.in.read()) != '\n') {
                if (!s.isFull()) {
                    s.push(ch);
                }
            }
        System.out.println("\nsize = "+s.length());
        System.out.println("\n\nYour name reverse is:");
        while (!s.isEmpty()) {
            System.out.print(s.pop());
        }
        System.out.println("\n\n");
    }
}
