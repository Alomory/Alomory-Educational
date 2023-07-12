
import java.util.Scanner;

public class DFS{

    public static Node root;
    public int maxColor;
    public int maxVertex;

    

    public DFS(){
        this.root = null;
    }

    // finding the data in the tree
    public Node find(int vertex){
        Node current = root;
    
        while(current !=null){
            if(current.vertex == vertex){
                return current;
            }else if(current.vertex > vertex ){
                current = current.left;
            }else{
                current = current.right;
            }
        }
        return null;
    }
    public int getColor(int vertex){
       return find(vertex).color;
    }

    public void insert(int id , int color ){
        maxVertex++;
        Node newNode = new Node(id , color ,maxVertex);
        if(root == null){
            root = newNode;
           
            return;
        }
        Node current = root;
        Node parent = null;
        while(true){
            parent = current;
            if(maxVertex< current.vertex){
                current = current.left;
                if(current == null){
                    parent.left = newNode;
                  
                    return;
                }
            }else{
                current = current.right;
                if(current == null){
                    parent.right = newNode;
                    
                    return;
                }
            }
        }
    }

    void printAncestorsWithSameColor(Node node,  Node target) {
        // Base case: node is null or target is not found in the tree
        if (node == null) {
            return;
        }
    
        // If target is found, print the current node and return
        
         if (node.color == target.color && node.vertex == target.vertex) {
            System.out.print(-1 + " ");
            return;
        }else if (node.color == target.color) {
            System.out.print(node.vertex+ " ");
            return;
        }
        // Recursive case: search for the target in the left and right subtrees
        printAncestorsWithSameColor(node.left, target);
        printAncestorsWithSameColor(node.right, target);
    }



    class Node{
        int data , color , vertex;
        Node left;
        Node right;
        public Node (int data ,int color , int vertex){
            this.data = data;
            this.color = color;
            this.vertex =vertex;
            left = null;
            right = null;
          
        }
        
    }
    public static void main(String[] args) {
        DFS b = new DFS();
        Scanner in = new Scanner(System.in);
        // assigning values to N and C 
        String temp = in.nextLine();
        String[] N,C;
        N = new String [Integer.parseInt(temp.substring(0,1))] ;
        C = new String[Integer.parseInt(temp.substring(2,temp.length()))];
        // ----------------------------------------------------------------------------
        // Asigning values to N[i]
        temp = in.nextLine();
        N[0] = "0";
        N = temp.split(" ");
        //Asigning values to C[i]
        temp = in.nextLine();
        C = temp.split(" ");

        for(int i = 0 ; i <= N.length; i ++){
            if(i == 0){
                b.insert(0, Integer.parseInt(C[i])); // for the root
            }else{
                b.insert(Integer.parseInt(N[i-1]), Integer.parseInt(C[i]));
            }
        }

        

       for(int i = 1; i <=b.maxVertex; i++){
        b.printAncestorsWithSameColor(b.root, b.find(i));
       }                
    }
}
/*
 * Algorithm: 
 * ----------
 * 
Create a new BinarySearchTree object called b.
Initialize a Scanner object called in to read from the input stream.
Read the first line of input and split it into two strings, N and C.
Read the second line of input and assign it to the temp variable. Set the first element of N to "0" and assign the rest of the elements of temp to N after it has been split by spaces.
Read the third line of input and assign it to the temp variable. Assign the elements of temp to C after it has been split by spaces.
Print out the contents of N and C.
For each element in N and C, insert it into the BinarySearchTree with the following logic: if the index of the element is 0, insert the element at the root with a value of 0. Otherwise, insert the element at its corresponding index in N with the corresponding value in C.
For each vertex in the BinarySearchTree, call the printAncestorsWithSameColor function with the root of the tree and the vertex as arguments.
 */