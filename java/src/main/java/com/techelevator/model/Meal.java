package com.techelevator.model;

import java.util.Date;

public class Meal {

    private int meal_id;

    private String meal;

    private Date date;

    public Meal() { }

    public Meal(int meal_id, String meal, Date date) {
        this.meal_id = meal_id;
        this.meal = meal;
        this.date = date;
    }

    public int getMeal_id() {
        return meal_id;
    }

    public void setMeal_id(int meal_id) {
        this.meal_id = meal_id;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
