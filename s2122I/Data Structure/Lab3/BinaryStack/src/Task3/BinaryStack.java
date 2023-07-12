
package Task3;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 19/11/2022
 */
public class BinaryStack {
  private static final int DEFAULT_SIZE = 10;

	private int size;
	private int top;
	private int[] stack;

	public BinaryStack() {
		size = DEFAULT_SIZE;
		top = -1;
		stack = new int[DEFAULT_SIZE];
	}

	public BinaryStack(int size) {
		this.size = size;
		top = -1;
		stack = new int[size];
	}

	public void push(int data) {
		top++;
		stack[top] = data;
	}

	public int pop() {
		int data = stack[top];
		top--;
		return data;
	}

	public boolean isEmpty() {
		return top == -1;
	}

	public boolean isFull() {
		return top == size - 1;
	}

	public int length() {
		return top;
	}
  
}
