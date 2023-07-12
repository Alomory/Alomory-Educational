/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity2;

/**
 *
 * @author Omar Alomory
 */
 public class Node {
        private String element;
        private Node next;
        
        public Node (){
        }
        
        public Node(String element) {
            this.element = element;
            this.next = null;
        }

        public String printNode() {
            return this.element;
        }

        public Node getNext() {
            return this.next;
        }
        
        public void setNext(Node node){
            this.next = node;
        }

        public String getElement() {
            return element;
        }
    }
