
/*
 * Name: OMAR ISMAIL ALOMORY
 * Program: SMSK(KMA)
 * Course: CSF3013
 * Lab: MP3
 * Date: 29/11/2022
 */

package RecursionExperiment;

import java.util.Deque;
import java.util.ArrayDeque;
public class DequeDemo {

	public static void main(String[] args) {
		
        Deque<String> deque = new ArrayDeque<String>();
		deque.offer("Data");
		deque.offer("Structure");
		deque.add("and");
		deque.offerFirst("Algorithm");
		
		
		System.out.println("After OfferFirst Traversal ...");
		
		for(String s: deque) {
			System.out.println(s);
		}
        System.out.println("=====================================");
		deque.pollLast();
		System.out.println("After pollLast() Traversal ...");
		for(String s: deque) {
			System.out.println(s);
		}
		
	}
}
