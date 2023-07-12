package CircularQueue;

import java.util.Arrays;

/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class CircularQueue <E> {
   
	private int currentSize;
	private E []circularQueueElement;
	private int maxSize;
	private int front,rear;
	
	public CircularQueue(int maxSize) {
		this.maxSize= maxSize;
		circularQueueElement = (E[])new Object[this.maxSize];
		currentSize = 0 ;
		front= -1;
		rear = -1;
	}
	public E front() {
		return circularQueueElement[front];
	}
	public E rear() {
		return circularQueueElement[rear];
	}
	
	public void enqueue(E item) throws QueueFullException {
		if(isFull()) {
			throw new QueueFullException("CircularQueue is full. Element cannot be added");
		}else {
			rear = (rear + 1)%circularQueueElement.length;
			circularQueueElement[rear]= item;
			currentSize++;
			
			if(front == -1) {
				front = rear;
			}
		}
	}
	
	public E dequeue()throws QueueEmptyException{
		E dequeueElement ;
		if(isEmpty()) {
			throw new QueueEmptyException("CircularQueue is Empty. Element can not be retrieved");
		}else {
			dequeueElement = circularQueueElement[front];
			circularQueueElement[front]= null;
			front = (front+1)%circularQueueElement.length;
			currentSize--;
		}
		return dequeueElement;
	}
        
	public boolean isFull() {
		return (currentSize == circularQueueElement.length);	
	}
	public boolean isEmpty() {
		return currentSize == 0;
	}
        @Override
	public String toString() {
		return "CircularQueue ["+ Arrays.toString(circularQueueElement).strip() + "]";
	} 
}
