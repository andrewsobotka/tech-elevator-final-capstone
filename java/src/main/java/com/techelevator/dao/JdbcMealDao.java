package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Meal;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Component;

import java.security.Principal;
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

    @Override
    public List<Meal> getListOfMyMeals(Principal principal) {
        List<Meal> meals = new ArrayList<>();
        Integer userId;
        String sql_user_id = "SELECT user_id FROM users " +
                             "WHERE username = ?;";
        String sql_meals = "SELECT meals.meal_id, meals.meal_name, meals.meal_date FROM meals " +
                            "LEFT JOIN users_meals on meals.meal_id = users_meals.meal_id " +
                            "LEFT JOIN users on users_meals.user_id = users.user_id " +
                            "WHERE users.user_id = ?;";
        try {
            userId = jdbcTemplate.queryForObject(sql_user_id, Integer.class, principal.getName());
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql_meals, userId);
            while (results.next()) {
                Meal meal = mapRowToMeal(results);
                meals.add(meal);
            }
        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return meals;
    }

    private Meal mapRowToMeal(SqlRowSet rs) {
        Meal meal = new Meal();
        meal.setMealId(rs.getInt("meal_id"));
        meal.setMealName(rs.getString("meal_name"));
        meal.setMealDate(rs.getDate("meal_date"));
        return meal;
    }

}
