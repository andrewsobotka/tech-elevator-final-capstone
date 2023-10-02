package com.techelevator.dao;

import com.techelevator.model.Meal;

import java.security.Principal;
import java.util.List;

public interface MealDao {

    List<Meal> getListOfMeals();
    Meal getMealByMealId(int meal_id);
    List<Meal> getListOfMyMeals(Principal principal);
}
