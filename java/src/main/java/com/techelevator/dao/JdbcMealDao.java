package com.techelevator.dao;

import com.techelevator.model.Meal;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealDao implements MealDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcMealDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Meal> getListOfMeals() {
        List<Meal> meals = new ArrayList<>();
        String sql = "select * from meals";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Meal meal = mapRowToMeal(results);
            meals.add(meal);
        }

        return meals;
    }

    private Meal mapRowToMeal(SqlRowSet rs) {
        Meal meal = new Meal();
        meal.setMeal_id(rs.getInt("meal_id"));
        meal.setMeal(rs.getString("meal"));
        meal.setDate(rs.getDate("date"));
        return meal;
    }

}
