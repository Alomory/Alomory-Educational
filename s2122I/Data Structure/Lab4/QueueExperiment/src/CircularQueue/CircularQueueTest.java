package CircularQueue;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class CircularQueueTest {
    public static void main(String[] args) {
        CircularQueue<Integer> circularQueue = new CircularQueue(8);
        circularQueue.enqueue(15);
        circularQueue.enqueue(16);
        circularQueue.enqueue(17);
        circularQueue.enqueue(18);
        circularQueue.enqueue(19);
        circularQueue.enqueue(20);
        circularQueue.enqueue(21);
        circularQueue.enqueue(22);
        
        System.out.println("Full Circular Queue "+circularQueue);
        
        System.out.print("Dequeued the following element from the circular Queue ");
        System.out.println( circularQueue.dequeue()+" ");
        circularQueue.enqueue(23);       
        System.out.println("After enqueueing circular queue with element haveing value of 23");
        System.out.println(circularQueue);  
    }
}
