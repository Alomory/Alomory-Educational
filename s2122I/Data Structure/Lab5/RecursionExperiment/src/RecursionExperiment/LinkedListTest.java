
/*
 * Name: OMAR ISMAIL ALOMORY
 * Program: SMSK(KMA)
 * Course: CSF3013
 * Lab: MP3
 * Date: 29/11/2022
 */

package RecursionExperiment;

public class LinkedListTest {
    public static void main(String[] args) {
        LinkedListQueue mine =  new LinkedListQueue();
        mine.insert(2);
        mine.insert(1);
        mine.insert(0);
        mine.insert(3);
        mine.insert(0);
        System.out.println("-- Displaying Queue data--");
        mine.displayList();
        System.out.println("Item peeked- "+mine.peek());

        System.out.println("-- Removing Queue elements--");
        System.out.println("Item removed- "+mine.remove());
        System.out.println("Item removed- "+mine.remove());
    }
}

