import java.util.ArrayList;

import java.util.Scanner;

public class Stack {
    private static final int DEFAULT_SIZE = 10;
    private int size;
    private int top;
    private int[] stack;

    public Stack() {
        this.size = DEFAULT_SIZE;
        top = -1;
        this.stack = new int[size];
    }

    public Stack (int size) {
        this.size = size;
        top = -1;
        this.stack = new int[size];
    }

    void push(int data) {
        top++;
        stack[top] = data;
    }

    int pop() {
        int deletedData = stack[top];
        top--;
        return deletedData;
    }

    boolean isEmpty() {
        return (top == -1);
    }

    boolean isFull() {
        return (top == size - 1);
    }

    int length() {
        return top;
    }
    public int peak(){
        int temp = stack[top];
        return temp;
    }

    public static void main(String[] args) {
    
        Scanner in = new Scanner(System.in);
        Scanner inString = new Scanner(System.in);
        System.out.print("Input the size: ");
       
        int size = in.nextInt();
        String values = inString.nextLine();
        int [] start = new int[size];
        ArrayList <Integer> testing = new ArrayList<>();
        
        for(int i = 0; i < values.length() ; i ++){
            if(!(values.charAt(i) == ' ')){
                testing.add( Integer.parseInt(String.valueOf(values.charAt(i))));
            }
            
        }
        for(int i = 0; i < start.length; i ++ ){
            start[i] = testing.get(i);
        }


        // ------------------------------------------------ game start
        Stack A = new Stack();
        Stack B = new Stack();
        int count = start.length-1;
        for(int i = 0; i < start.length; i ++ ){
            A.push(start[count]);
            B.push(start[i]);
            count--;
        }
        while(!(A.isEmpty()||B.isEmpty())){
            if(A.peak() > B.peak()){
                System.out.print(1+" ");
                B.pop();
            }else if(B.peak() > A.peak()){
                System.out.print(2+" ");
                A.pop();
            }else{
                System.out.print(0+" ");
                A.pop();
                B.pop();
            }
        }
       
        

    }
    
}
/*
 * -------------------
 * Algorithm:
 * -------------------
Prompt the user to input the size of the array.
Read the size as an integer using in.nextInt() and store it in a variable called size.
Read a string of values separated by spaces using inString.nextLine() and store it in a variable called values.
Create an array called start with a size of size.
Create an ArrayList called testing to store integers.
Iterate through the characters in values.
For each character, check if it is a space. If it is not a space, convert it to an integer and add it to the testing ArrayList.
Iterate through start and assign each element the corresponding value in testing.
Create two instances of the Stack class, A and B.
Set a variable called count equal to the size of start minus 1.
Iterate through start.
For each element, push it onto stack A and the corresponding element from start onto stack B, using count as the index for A and the loop variable as the index for B.
Decrement count.
Enter a loop that continues until either stack A or stack B is empty.
Inside the loop, compare the top elements of A and B (using the peek() method).
If the top element of A is greater, print "1" and pop the top element from B.
If the top element of B is greater, print "2" and pop the top element from A.
If the top elements of A and B are equal, print "0", pop the top elements from both stacks.
continue the loop until either A or B isEmpty().
 */
