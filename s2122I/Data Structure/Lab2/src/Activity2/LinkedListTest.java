/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity2;

/**
 *
 * @author Omar Alomory
 */
public class LinkedListTest {
    public static void main(String[] args) throws Exception {
        LinkedList myLinkedList = new LinkedList();
        myLinkedList.addFirst("a");
        myLinkedList.addFirst("b");
        myLinkedList.addFirst("c");
        myLinkedList.addFirst("d");
        myLinkedList.addFirst("e");
        System.out.println(myLinkedList.printList());

        myLinkedList.removeLast();
        System.out.println(myLinkedList.printList());
 
        myLinkedList.add(1, "f");
        System.out.println(myLinkedList.printList());
        
        myLinkedList.addLast("g");
        System.out.println(myLinkedList.printList());
        
        myLinkedList.removeFirst();
        System.out.println(myLinkedList.printList());
        
        myLinkedList.reverse();
        System.out.println(myLinkedList.printList());
    }
}
