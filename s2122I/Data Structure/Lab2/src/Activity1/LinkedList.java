/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity1;

/**
 *
 * @author Omar Alomory
 */
public class LinkedList {

    private Node first;


    public LinkedList() {
        first = null;
    }

    public boolean isEmpty() {
        return first == null;
    }

    public void addFirst(int d1, double d2) {
        Node node = new Node(d1, d2);
        node.next = first;
        first = node;
    }

    public Node deleteFirst() {
        Node temp = first;
        first = first.next;
        return temp;
    }

    public void printList() {
        Node currentNode = this.first;
        System.out.println("List: ");
        while (currentNode != null) {
            currentNode.printNode();
            currentNode = currentNode.next;
        }
        System.out.println("");
    }

}
