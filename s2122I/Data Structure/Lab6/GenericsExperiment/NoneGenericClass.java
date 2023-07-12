/*
 * NAME: OMAR ISMAIL ALOMORY
 * PROGRAM: SMSK (KMA) K2
 * COURSE: CSF3013
 * LAB: MP3
 * DATE: 13/12/2022
 */
package GenericsExperiment;

public class NoneGenericClass{
    String obj1, obj2;
    
    public NoneGenericClass(String obj1, String obj2){
        this.obj1 =obj1;
        this.obj2 = obj2;
    }

    public void print(){
        System.out.println(obj1);
        System.out.println(obj2);
    }
}