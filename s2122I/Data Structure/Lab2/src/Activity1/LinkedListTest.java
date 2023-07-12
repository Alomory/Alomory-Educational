/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity1;

/**
 *
 * @author Omar Alomory
 */
public class LinkedListTest {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        list.addFirst(1, 1.01);
        list.printList();
        list.addFirst(2, 2.02);
        list.printList();
        list.addFirst(3, 3.03);
        list.printList();
        list.addFirst(4, 4.04);
        list.printList();
        list.addFirst(5, 5.05);
        list.printList();
        
        while(!list.isEmpty()){
            Node deletedLink = list.deleteFirst();
            System.out.print("Deleted");
            deletedLink.printNode();
            System.out.println("");
        }
        list.printList();
    }
}

