/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Lab1;

/**
 *
 * @author PC 48
 */
public class RectangleTest {

  
    public static void main(String[] args) {
       Rectangle myRect = new Rectangle(12.5,10);
//       myRect.setWidth(2.0);
//       myRect.setHeight(3.3);
       double theArea = myRect.area();
        System.out.println("Width is "+myRect.getWidth());
        System.out.println("Height is "+myRect.getHeight());
        System.out.println("My rectangle has area "+theArea);
        System.out.println("my Perimeter is "+myRect.perimeter());
    }
    
}
