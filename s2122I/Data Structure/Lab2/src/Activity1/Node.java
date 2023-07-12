/*
Name: Omar Ismail AbdJaleel Alomroy
Maric No: S63955
 */
package Activity1;

/**
 *
 * @author Omar Alomory
 */
public class Node {

        public int data1;
        public double data2;
        public Node next;

        public Node(int d1, double d2) {
            data1 = d1;
            data2 = d2;
            next = null;
        }

        public void printNode() {
            System.out.print("{" + data1 + ", " + data2 + "}");
        }
}
