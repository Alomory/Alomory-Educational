package PriorityQueueExperiment;
/* Name: OMAR ISMAIL ABDJALEEL ALOMORY
 * Program: SMSK (KMA)
 * Course: CSF3013
 * Lab: 7
 * Date: 3/1/2023
 */
import java.util.NoSuchElementException;
public class MyPriorityQueue {
    private int[] innerArray;
    private int size;
    
    public MyPriorityQueue(){
        this.innerArray = new int[10];
        size = 0;
    }
    
    public void enqueue(int x){
        //if it is empty,insert in front
        if (size == 0){
            size++;
            innerArray[0] = x;
            return;
        }
        
        //if full, we'll have to double the array
        if (size() == innerArray.length){
            doubleArray();
        }
        
        //looping through
        int temp = x;
        int i ;
        for ( i = size-1;i>=0;i--){
            //if priority is higher, ie. values is lower, we shift
            if (x <= innerArray[i]){ // if we want to swap (ex Desc, Asc)
                innerArray[i+1]= innerArray[i];
               
            }else{
                 break;
            }
        }
        innerArray[i+1] = x;
        size++;
    }
    
    public int dequeue(){
        //noSuchElement
        if (isEmpty()){
            throw new NoSuchElementException("The queue is empty");
        }
        //Storing first int for return
        int retValue = innerArray[0];
        //shifting all values downwards
        for (int i = 1;i < size; i++){
            innerArray[i-1] = innerArray[i];
        }
        innerArray[size-1] = 0;
        size--;
        return retValue;
    }
    
    public int peek(){
        if (isEmpty()){
            throw new NoSuchElementException("The queue is empty");
        }
        return innerArray[0];
    }
    
    public boolean contains(int x){
        //check for empty
        if (isEmpty()){
            return false;
        }
        //looping through the positions which contains inserted values,
        //ignoring trailing default 0 values
        for (int i = 0;i < size;i++){
            //comparing
            if (innerArray[i] == x){
                return true;
            }
        }
        //none found
        return false;
    }
    
    public boolean isEmpty(){
        return size == 0;
    }
    
    public int size(){
        return size;
    }
    
    public void doubleArray(){
        int[] newArr = new int[innerArray.length * 2];
        for (int i = 0;i < innerArray.length;i++){
            newArr[i] = innerArray[i];
        }innerArray = newArr;
    }
    public String display(){
        // String for just fomatting to look like Array or something like that
        String format = "[";
        while(!isEmpty()){
            if(size == 1){
               format +=dequeue();
            }else{
                format +=dequeue()+", ";
            }
            
        }
        return format+"]";
    }
    public static void main(String[] args) {
        MyPriorityQueue p = new MyPriorityQueue();
        // 7 integers
        p.enqueue(7);// first one entered
        p.enqueue(11);
        p.enqueue(8);
        p.enqueue(25);
        p.enqueue(13);
        p.enqueue(9);
        p.enqueue(4);// last one entered
        System.out.println(p.display());
        // as the output show the queue sorted
    }
}
