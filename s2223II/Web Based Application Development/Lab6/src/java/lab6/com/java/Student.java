package lab6.com.java;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Omar Alomory(S63955)
 */
public class Student {
    private String stuno;
    private String stuname;
    private String stuprogram;

    public String getStuno() {
        Pattern pt = Pattern.compile("[A-Z0-9]*");
        Matcher mt = pt.matcher(stuno);
        boolean bl = mt.matches();
        
        if(bl == true){
            return this.stuno;
        }else{
             throw new NumberFormatException("<p style='color:red'>Error occur: Format is invaild for <b>"+this.stuno+" </b><p>");
        }

       
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }
    

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getStuprogram() {
        return stuprogram;
    }

    public void setStuprogram(String stuprogram) {
        this.stuprogram = stuprogram;
    }

}
