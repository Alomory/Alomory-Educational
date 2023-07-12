package com;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class StockCalculator {
    private int shares;
    private double pricePerShare;
    private int commissionRate;

    public void setShares(int shares) {
        this.shares = shares;
    }

    public void setPricePerShare(double pricePerShare) {
        this.pricePerShare = pricePerShare;
    }

    public void setCommissionRate(int commissionRate) {
        this.commissionRate = commissionRate;
    }

    public int getShares() {
        return shares;
    }

    public double getPricePerShare() {
        return pricePerShare;
    }

    public int getCommissionRate() {
        return commissionRate;
    }

    public double getAmountWithoutCommission() {
        return shares * pricePerShare;
    }

    public double getCommissionAmount() {
        return getAmountWithoutCommission() * (commissionRate / 100.0);
    }

    public double getTotalAmountPaid() {
        return getAmountWithoutCommission() + getCommissionAmount();
    }

}

