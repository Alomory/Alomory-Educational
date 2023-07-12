/*
 * A bracket sequence is a string that contains only characters '(' and ')'.
A correct bracket sequence is a bracket sequence that can be transformed into a correct
arithmetic expression by inserting characters '1' and '+' between the original characters of
the sequence. For example, bracket sequences '()()' and '(())' are correct. The
resulting expressions of these sequences are: '(1)+(1)' and '((1+1)+1)'. However,
'(', ')(', and '(' are incorrect bracket sequences.
You are given a bracket sequence s(s1s2...sn), where si denotes the type of i's bracket
(open or close). It is not mandatory that s is necessarily correct. Your task is to determine
the number of i's such that sisi+1...sns1s2...si−1 is a correct bracket sequence.
Input format
The single line contains sequence s.
Output format
Print the number of shifts denoting the correct bracket sequence.
Constraints
|s|≤5×105
Sample Input
)()()(
Sample Output
3
 */
import java.util.Arrays;
import java.util.Scanner;
public class Array{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String input = in.nextLine();
        char my[] = new char[input.length()];
        boolean check[] = new boolean[input.length()];
        for(int i = 0; i < my.length; i ++){
            my[i]= input.charAt(i);
            check[i] = true;
        
        }
        int count = 0;
      
        for(int i = 0; i < input.length(); i ++){
            if(check[i] == true){
                for(int j = i+1; j < input.length(); j ++){
                    if(check[j]== true){
                        switch(my[i]){
                            case '(':
                            if(my[j] ==')'){
                                check[j]= false;
                                count++;
                                break;
                            }
                            case')':
                            if(my[j] == '('){
                                check[j]= false;
                                count++;
                                break;
                            }
                        }
                        break;
                    }

                }
            }
        }
        System.out.println(count);
      
    }
}
/*
 * ----------------------
 * Algorithm
 * ----------------------
    Create a Scanner instance called in to read input from the command line.
    Read a string of characters from the command line using in.nextLine() and store it in a variable called input.
    Create a character array called my with a size equal to the length of input.
    Create a boolean array called check with a size equal to the length of input.
    Iterate through my and assign each element the corresponding character in input. Set each element of check to true.
    Set a variable called count to 0.
    Iterate through input.
    For each character, if its corresponding element in check is true, iterate through input again, starting at the next character.
    For each character in the inner loop, if its corresponding element in check is true, perform a switch statement based on the current character in the outer loop.
    If the current character in the outer loop is an opening parenthesis and the current character in the inner loop is a closing parenthesis, or vice versa, set the corresponding element in check to false and increment count.
    After the inner loop finishes, break out of the inner loop.
    Print count after the outer loop finishes.
 */