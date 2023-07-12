/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab1;

/**
 *
 * @author PC 48
 */
public class TestKipas {
    public static void main(String[] args) {
        Kipas k1 = new Kipas();
        k1.setColor("merah");
        k1.setRadius(10);
        k1.setSpeed(3);
        k1.setTurnFanOn(true);
        System.out.println(k1);
        
         Kipas k2 = new Kipas();
        k2.setColor("biru");
        k2.setRadius(5);
        k2.setSpeed(2);
        k2.setTurnFanOn(false);

        System.out.println(k2);
        
      
    }
}
