package com.example.bmi.model;

public class User {
    private String username;
    private String password;
    private double weight;
    private double height;

    public User(String username, String password, double weight, double height) {
        this.username = username;
        this.password = password;
        this.weight = weight;
        this.height = height;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public double getWeight() { return weight; }
    public double getHeight() { return height; }

    public void setWeight(double weight) { this.weight = weight; }
    public void setHeight(double height) { this.height = height; }

    public double calculateBMI() {
        return weight / (height * height);
    }
}
