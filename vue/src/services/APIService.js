import axios from "axios";

export default{
    getRecipes(){
        return axios.get("/recipes")
    },

    getRecipe(recipeId){
        return axios.get(`/recipes/${recipeId}`)
    },

    addRecipe(recipe){
        return axios.post('/recipes', recipe)
      },

    editRecipe(recipe){
       return axios.put(`/recipes/${recipe.recipeId}`, recipe);
    },

    deleteRecipe(recipe){
        return axios.delete(`/cards/${recipe.recipeId}`);
      }

}