package CircularQueue;
/**
 * @author Omar Alomory 
 * Program: SMSK(KMA) K2 
 * Course: CSF3013 
 * Lab: MP3 
 * Date: 27/11/2022
 */
public class QueueFullException extends RuntimeException {
    private static final long serialVersionUID = 1L;
	
	public QueueFullException() {
		super();
	}
	public QueueFullException(String message) {
		super(message);
	}
}
