import java.util.Scanner;

public class Queue{
    private int max;
    private int[] queue;
    private int noOfItems;

    public Queue(int size){
        this.max = size;    //  N denoting the total number of disks that are given to you in the N subsequent days
        queue = new int[max]; //initializing the array to the maximum i-th in Day (disk)
        noOfItems  =0; // number of items in Queue
    }
    // to insert element to based on the Priority and sort it
    public void insert(int value){
        int i ;
        // if no of items is 0 then the value will be inserted at 0 index
        if(noOfItems == 0){
            queue[0] = value;
            noOfItems++;
            return;
        }
        // else no of items is > 0 then value is compared and sorted
        for(i = noOfItems-1; i >= 0 ; i--){
            if(value < queue[i]){
                queue[i+1] = queue[i];
            }else{
                break;
            }
        }
        queue[i+1] = value; // insertion of the value after sorting
        noOfItems++;
    }
    // mostly used
    public int remove(){
        max--;
        return queue[--noOfItems];
    }
    // not used
    public boolean isfull(){
        return noOfItems == max;
    }
    // used for checking if there is items in the array
    public boolean isEmpty(){
        return noOfItems == 0;
    }
    public int peek(){
        return queue[noOfItems - 1];
    }
    public int size(){
        return max;
    }
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Queue tower = new Queue(Integer.parseInt(in.nextLine())); // max
        String stringDisk[] = in.nextLine().split(" ");// split the values and save it in array

        for(int i = 0; i < stringDisk.length; i ++){
            tower.insert(Integer.parseInt(stringDisk[i])); // insert and sort the values 
            while (!tower.isEmpty() && tower.peek() == tower.size()) { // if both are true poll or remove the values from the array

                System.out.print(tower.remove() + " ");    
            }
            System.out.println();
        }
    }
}
/*
 * ------------
 * Algorithm
 * ------------
Initialize a Queue object with a maximum size.
Read in a line of input and parse it into an array of integers.
For each integer in the array:
    Insert the integer into the queue.
    If the bottom element of the queue (peek) is equal to the size of the queue, and the queue is not empty:
    Remove the bottom element of the queue and print it.
    If the queue is not empty, print the remaining elements of the queue.
----------------
Explanation
----------------
On the first day, the disk of size 4 is given. But you cannot put the disk on the bottom of the tower as a disk of size 5 is still remaining.

On the second day, the disk of size 5 will be given so now disk of sizes 5 and 4 can be placed on the tower. 

On the third and fourth day, disks cannot be placed on the tower as the disk of 3 needs to be given yet. Therefore, these lines are empty. 

On the fifth day, all the disks of sizes 3, 2, and 1 can be placed on the top of the tower.
 */