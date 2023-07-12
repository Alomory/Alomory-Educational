/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab1;

/**
 *
 * @author PC 48
 */
public class Kipas {
    private final int PERLAHAN = 1,SEDERHANA = 2,LAJU =3;
    private int speed ;
    
    private boolean turnFanOn;
    
    private double radius;
    private String color;
    
    public Kipas(){
        this.speed = PERLAHAN;
        this.turnFanOn = false;
        this.radius = 5;
        this.color ="biru";
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        if(speed>LAJU)
            this.speed = LAJU;
        else if(speed < 1)
            this.speed = PERLAHAN;
        else
            this.speed=speed;
    }

    public boolean isTurnFanOn() {
        return turnFanOn;
    }

    public void setTurnFanOn(boolean turnFanOn) {
        this.turnFanOn = turnFanOn;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    public String toString(){
        if(isTurnFanOn()){
            return"Speed "+this.speed+", the fan is turned on , color is "+this.color+
                    ", radius is "+this.radius;
        }else{
            return"Speed "+this.speed+", the fan is turned off , color is "+this.color+
                    ", radius is "+this.radius;
        }
    }
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
