/*
 * NAME: OMAR ISMAIL ALOMORY
 * PROGRAM: SMSK (KMA) K2
 * COURSE: CSF3013
 * LAB: MP3
 * DATE: 13/12/2022
 */
package GenericsExperiment;


public class GenericClassDemo {
    public static void main(String[] args) {
        // NoneGenericClass test = new NoneGenericClass("Final","Exam");
        // test.print();
        MyGenericClass<String, Integer> myGC = 
        new MyGenericClass<>("Final Exam", 2019);
        myGC.print();
    }
}
