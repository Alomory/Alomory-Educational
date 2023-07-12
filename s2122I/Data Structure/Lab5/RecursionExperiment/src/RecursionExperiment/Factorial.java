
/*
 * Name: OMAR ISMAIL ALOMORY
 * Program: SMSK(KMA)
 * Course: CSF3013
 * Lab: MP3
 * Date: 29/11/2022
 */

package RecursionExperiment;

public class Factorial {
    public static int factorial (int n) throws IllegalArgumentException{
        if (n < 0 ){
            throw new IllegalArgumentException();
        }else if (n ==  0){
            return 1;
        }else{
            return n * factorial(n - 1);
        }
    } 
    public static void main(String[] args) {
        System.out.println(factorial(6));
    }
}
