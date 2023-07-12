/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab1;

/**
 *
 * @author PC 48
 */
public class Rectangle {
    private double height ,width  ;
    
    public Rectangle(){
        setHeight(10);
        setWidth(12.5);
    }
    public Rectangle( double w,double h){
        setHeight(h);
        setWidth(w);
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }
    
    
    
    public double area(){
        double theArea;
        
        theArea = height * width;
        return theArea;
    }
    public double perimeter(){
        double thePerimeter = 2*(this.height+this.width);
        return thePerimeter;   
    }
}
