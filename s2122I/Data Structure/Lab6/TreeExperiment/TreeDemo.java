/*
 * NAME: OMAR ISMAIL ALOMORY
 * PROGRAM: SMSK (KMA) K2
 * COURSE: CSF3013
 * LAB: MP3
 * DATE: 13/12/2022
 */
package TreeExperiment;

public class TreeDemo{
    public static void main(String[] args) {
        Node<String> root = new Node<>("root");
        Node<String> node1 =root.addChild(new Node<String>("node1"));
        Node<String> node11 =node1.addChild(new Node<String>("node11"));
        Node<String> node111=node11.addChild(new Node<String>("node111"));
        Node<String> node112 =node11.addChild(new Node<String>("node112"));
        Node<String> node12 =node1.addChild(new Node<String>("node12"));
        Node<String> node2 =root.addChild(new Node<String>("node2"));
        Node<String> node21 =node2.addChild(new Node<String>("node21"));
        Node<String> node211 =node2.addChild(new Node<String>("node22"));
        Node<String> node212 =node2.addChild(new Node<String>("node23"));
        root.printTree(root , " "); 
        
        // Node<Double> root = new Node<>(1.0);
        // Node<Double> node1 =root.addChild(new Node<Double>(1.1));
        // Node<Double> node11 =node1.addChild(new Node<Double>(1.11));
        // Node<Double> node111=node1.addChild(new Node<Double>(1.12));
        // Node<Double> node112 =node111.addChild(new Node<Double>(1.121));
        // Node<Double> node12 =node111.addChild(new Node<Double>(1.122));
        // Node<Double> node2 =root.addChild(new Node<Double>(1.2));
        // Node<Double> node21 =node2.addChild(new Node<Double>(1.21));
        // Node<Double> node211 =node21.addChild(new Node<Double>(1.211));
        // Node<Double> node212 =node211.addChild(new Node<Double>(1.2111));
        // Node<Double> node213 = node211.addChild( new Node<Double> (1.2112));
        // Node<Double> node214 = node2.addChild(new Node<Double>(1.22));
        // root.printTree(root , " "); 
    }
}