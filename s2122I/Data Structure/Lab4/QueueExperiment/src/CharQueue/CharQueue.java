package CharQueue;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class CharQueue {

    char q[];
    int front, rear, size;

    public CharQueue(int m) {
        size = m;
        q = new char[size];
        front = rear = -1;
    }
    // Place an item at the back of the queue.
    void enqueue(char n) {
        if (isFull()) {
            System.out.println("Queue is full");
        } else {
            if (front == -1) {
                front = rear = 0;
            } else {
                rear++;
            }
            q[rear] = n;
        }
    }
    /* retrieves the element at the front of the
         queue and removes it from the queue */
    char dequeue() {
        if (isEmpty()) {
            System.out.println("Queue is empty");
            return (char) 250;
        } else {
            char x = q[front];
            front++;
            return x;
        }
    }

    /* retrieves the element at the front of the
     queue without removing it from the queue */
    char peek() {
        return q[front];
    }
    // checks if the queue is empty.
    boolean isEmpty() {
        return (front == -1 || front > rear);
    }
    // checks if the queue is full. 
    boolean isFull() {
        return (rear == size - 1);
    }

    // returning all the values in the queue as String for later uses
    @Override
    public String toString() {
        String result = "[ ";
        for (int i = this.front; i <= this.rear; i++) {
            result += String.valueOf(q[i]) + " ";
        }return result + "]";
    }
    
    /* if we want to apply enqueue with shifting when rear is equal to 
       size but there still some empty spaces due to dequeuing 
    */
    public void superEnqueu(char n){
        if ((rear - front + 1) == this.size ) {
            System.out.println("Queue is full");
            
        } else if (isFull() && (rear - front ) < this.size -1){
        // if we want to apply shifting we can use this i guess 
        for(int i = this.front; i <= this.rear-1; i++){
            q[i] = q[i+1];
        }
        front--;
        q[rear] = n;
        }
        else {
            if (front == -1) {
                front = rear = 0;
            } else {
                rear++;
            }
            q[rear] = n;
        }
    }
}
