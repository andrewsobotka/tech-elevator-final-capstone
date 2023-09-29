package com.techelevator.controller;

import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import com.techelevator.service.MealService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class MealController {
    private final MealDao mealDao;
    private final MealService mealService;

    public MealController(MealDao mealDao, MealService mealService) {
        this.mealDao = mealDao;
        this.mealService = mealService;
    }
    @GetMapping("/meals")
    public List<Meal> getMeals(){
        return mealDao.getListOfMeals();
    }

    @GetMapping("/meals/{mealId}")
    public Meal getMealById(@PathVariable int mealId){
        return mealDao.getMealByMealId(mealId);
    }
}
