package com;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Omar Alomory(S63955)
 */
public class Register {

    private String icNo;
    private String name;
    private String traningType;
    private String noOfPax;
    private String stuCheck;
    private double amount;

    public String getIcNo() {
        return icNo;
    }

    public void setIcNo(String icNo) {
        this.icNo = icNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTraningType() {
        return traningType;
    }

    public void setTraningType(String switchCode) {
            String temp;
            switch (switchCode.charAt(0)) {
                case '1':temp = "C++ training";setAmount(3000);break;
                case '2':temp = "Java for beginner";setAmount(3000);break;
                case '3':temp = "HTML5";setAmount(2800);break;
                case '4':temp = "Java EEE";setAmount(5500);break;
                case '5':temp = "Android Programming ";setAmount(3200);break;
                default:temp="Nothing Was Chosen"; setAmount(0.0);
            }
        this.traningType = temp;
    }

    public String getNoOfPax() {
        return noOfPax;
    }

    public void setNoOfPax(String noOfPax) {
        this.noOfPax = noOfPax;
    }

    public String isStuCheck() {
        return stuCheck;
    }

    public void setStuCheck(String stuCheck) {
        if(stuCheck.equals("1")){
            this.stuCheck = "Yes";
        }else{
            this.stuCheck = "No";
        }
        
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
       
        if(!isStuCheck().contains("No")){
                this.amount = (amount * Integer.parseInt(getNoOfPax())) - (amount * 0.1);
            
        }else{
            this.amount = amount;
        }
    }

}
