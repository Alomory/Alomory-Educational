/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity2;

/**
 *
 * @author Omar Alomory
 */
public class LinkedList {

    private Node head, tail = null;
    private int size = 0;
    

    
    
    public Node getHead() {
        return this.head;
    }

    public Node getTail() {
        return this.tail;
    }

    // check if the linked list is empty or not
    public boolean isEmpty() {
        return size == 0;
    }
    // ---------------------
    // retrun the size value 
    public int size() {
        return size;
    }

    // adding to first element in the linked list
    public void addFirst(String n) {
        Node node = new Node(n);
        if (head == null) {
            head = node;
            tail = node;
            size++;
        } else {
            node.setNext(head);
            head = node;
            size++;
        }
    }
    // -----------------------------------
    
    // adding to the last element in the linked list
    public void addLast(String n) {
        Node node = new Node(n);
        if (head == null) {
            head = node;
            tail = node;
            size++;
        } else {
            tail.setNext(node);
            tail = node;
            size++;
        }
    }
    // ---------------------------------

    // adding at specific index
    public void add(int index, String data) throws Exception {
        Node node = new Node(data);
        if (index >= size) {
            throw new IndexOutOfBoundsException("Index [" + index + "] is higher than the size [" + this.size + "]");
        } else if (isEmpty()) {
            throw new Exception("Linked list is empty");
        } else if (index == 0) {
            addFirst(data);
            size++;
        } else {

            Node temp = head;
            int randomNumberHeheh = 0;
            while (temp != null) {
                if (index - 1 == randomNumberHeheh) {
                    break;
                } else {
                    temp = temp.getNext();
                    randomNumberHeheh++;
                }
            }
            node.setNext(temp.getNext());
            temp.setNext(node);
            size++;
        }
    }
//-----------------------------------------------------
    
    // remove first element in Linked list
    public Node removeFirst() {
        Node temp = head;
        head = head.getNext();
        temp.setNext(null); 
        size--;
        return temp;
    }
    // ---------------------------------------------------

    // remove last element in Linked list
    public Node removeLast() {
        if (head == null)
            return null;

        if (head.getNext() == null) {
            return null;
        }

        // Find the second last node
        Node second_last = head;
        while (second_last.getNext().getNext() != null)
            second_last = second_last.getNext();

        // Change next of second last
        second_last.setNext(null);
        Node temp = tail;
        tail = second_last;
        size--;
        return temp;
    }
    // --------------------------------

    // reverse ---
    public void reverse() {
        Node next = null;
        Node previous = null;
        Node current = head;
        Node tempHead = head;
        Node tempTail = tail;

        while (current != null) {
            next = current.getNext();
            current.setNext(previous);
            previous = current;
            current = next;
        }
        head = tempTail;
        tail = tempHead;

    }
    // ------------------------

    // printing all element in the linked list
    public String printList() throws Exception {
        String result = "[";
        if (head == null) {
            throw new Exception("Linked list is empty");

        } else {
            
            int tempSize = 0;
            Node currentNode = head;
            while (currentNode != null) {
                if(tempSize < size-1)
                    result += currentNode.printNode() +", ";
                else
                    result += currentNode.printNode();
                currentNode = currentNode.getNext();
                tempSize++;
            }
            return result +"]";
        }
    }
    
}
