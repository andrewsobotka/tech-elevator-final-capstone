package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import com.techelevator.model.Step;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcStepDao implements StepDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcStepDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Step> getListOfSteps() {
        List<Step> steps = new ArrayList<>();
        String sql = "select * from steps";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Step step = mapRowToStep(results);
            steps.add(step);
        }

        return steps;
    }

//    @Override
//    public Step getStepsByRecipeId(int recipe_id) {
//
//        Recipe recipe = null;
//        String sql = "SELECT * from steps where recipe_id = ? ;";
//        try {
//            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
//            if (results.next()) {
//                recipe = mapRowToRecipe(results);
//            }
//        } catch (CannotGetJdbcConnectionException e) {
//            throw new DaoException("Unable to connect to server or database", e);
//        } catch (DataIntegrityViolationException e) {
//            throw new DaoException("Data integrity violation", e);
//        }
//
//        return recipe;
//
//    }

    private Step mapRowToStep(SqlRowSet rs) {
        Step step = new Step();
        step.setStep_id(rs.getInt("step_id"));
        step.setRank(rs.getInt("rank"));
        step.setInstruction(rs.getString("instruction"));
        return step;
    }

}
