package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Meal;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealDao implements MealDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcMealDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Meal> getListOfMeals() {
        List<Meal> meals = new ArrayList<>();
        String sql = "SELECT * FROM meals";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Meal meal = mapRowToMeal(results);
            meals.add(meal);
        }

        return meals;
    }

    @Override
    public Meal getMealByMealId(int meal_id) {
        Meal meal = null;
        String sql = "SELECT * FROM meals where meal_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, meal_id);
            if (results.next()) {
                meal = mapRowToMeal(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return meal;
    }

    private Meal mapRowToMeal(SqlRowSet rs) {
        Meal meal = new Meal();
        meal.setMeal_id(rs.getInt("meal_id"));
        meal.setMeal(rs.getString("meal_name"));
        meal.setDate(rs.getDate("male_date"));
        return meal;
    }

}
