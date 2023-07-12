
package CharQueue;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class QueueExperiment {
    public static void main(String[] args) {
        CharQueue myQueue = new CharQueue(10);
    
        myQueue.enqueue('a'); // 0
        myQueue.enqueue('b'); // 1
        myQueue.enqueue('c'); // 2
        myQueue.enqueue('d'); // 3
        System.out.println("Before dequeue, first element is "+myQueue.peek());
        System.out.println(myQueue);
        myQueue.dequeue();
        myQueue.dequeue();
        System.out.println("After dequeue, first element is "+myQueue.peek());
        myQueue.enqueue('e'); // 2 
        myQueue.enqueue('f'); // 3
        myQueue.enqueue('g'); // 4
        myQueue.enqueue('h'); // 5
        myQueue.enqueue('i'); // 6
        myQueue.enqueue('j'); // 7
        myQueue.superEnqueu('k'); // 8  applying superQueue()
        myQueue.superEnqueu('l'); // 9  applying superQueue()
        
        System.out.println(myQueue);
    }
    
}
