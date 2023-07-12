/*
 * NAME: OMAR ISMAIL ALOMORY
 * PROGRAM: SMSK (KMA) K2
 * COURSE: CSF3013
 * LAB: MP3
 * DATE: 13/12/2022
 */
package GenericsExperiment;

public class MyGenericClass <T , U> {
    T obj1;
    U obj2;
    
    public MyGenericClass(T obj1, U obj2){
        this.obj1 =obj1;
        this.obj2 = obj2;
    }

    public void print(){
        System.out.println(obj1);
        System.out.println(obj2);
    }
}
