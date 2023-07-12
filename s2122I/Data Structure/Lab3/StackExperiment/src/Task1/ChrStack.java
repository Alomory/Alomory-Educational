
package Task1;
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 19/11/2022
 */
public class ChrStack {

    private static final int DEFAULT_SIZE = 10;
    private int size;
    private int top;
    private char[] stack;

    public ChrStack() {
        this.size = DEFAULT_SIZE;
        top = -1;
        this.stack = new char[size];
    }

    public ChrStack(int size) {
        this.size = size;
        top = -1;
        this.stack = new char[size];
    }

    void push(char data) {
        top++;
        stack[top] = data;
    }

    char pop() {
        char deletedData = stack[top];
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

    
}
