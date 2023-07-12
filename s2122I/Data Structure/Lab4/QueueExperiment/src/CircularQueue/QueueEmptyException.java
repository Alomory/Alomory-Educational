package CircularQueue;
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class QueueEmptyException extends RuntimeException{
    private static final long serialVersionUID = 1L;

	public QueueEmptyException() {
		super();
	}
	public QueueEmptyException(String message) {
		super(message);
	}
}
