import axios from "axios";

export default {
    //recipes

    getRecipes() {
        return axios.get("/recipes")
    },

    getRecipe(recipeId) {
        return axios.get(`/recipes/${recipeId}`)
    },

    addRecipe(recipe) {
        return axios.post('/recipes', recipe)
    },

    editRecipe(recipe) {
        return axios.put(`/recipes/${recipe.recipeId}`, recipe);
    },

    deleteRecipe(recipe) {
        return axios.delete(`/recipes/${recipe.recipeId}`);
    },

    getCreatorUsernameByRecipeId(recipeId){
        return axios.get(`/recipes/${recipeId}/creator`)
    },
    setFeatured(recipe){
        return axios.put(`/recipes/${recipe.recipeId}/featured`, recipe.isFeatured)
    },

    addToFavorites(recipeId){
        return axios.post(`/recipes/${recipeId}/favorites`, this.userId)
    },


    //tags
    getTags() {
        return axios.get("/tags")
    },

    getTag(tagId) {
        return axios.get(`/tags/${tagId}`)
    },

    addTag(tag) {
        return axios.post('/tags', tag)
    },

    editTag(tag) {
        return axios.put(`/tags/${tag.tagId}`, tag);
    },

    deleteTag(tagId) {
        return axios.delete(`/tags/${tagId}`);
    },


    //needtofix the endpoint
    getRecipeByTagId(tagId) {
        return axios.get(`/tags/${tagId}`)
    },

    getRecipesByTags(tag){
        return axios.get(`/recipes/${tag}`)
    },


    //users

    getUsers() {
        return axios.get("/users")
    },

    getUser(userId) {
        return axios.get(`/users/${userId}`)
    },

    addUser(user) {
        return axios.post('/users', user)
    },

    editUser(user) {
        return axios.put(`/users/${user.userId}`, user);
    },

    deleteUser(user) {
        return axios.delete(`/users/${user.userId}`);
    },

    userPrivacy(userId){
        return axios.get(`/users/${userId}/privacy`);
    },

    //ingredients

    getIngredients() {
        return axios.get("/ingredients")
    },

    getIngredient(ingredientId) {
        return axios.get(`/ingredients/${ingredientId}`)
    },

    addIngredient(ingredient) {
        return axios.post('/ingredients', ingredient)
    },

    editIngredient(ingredient) {
        return axios.put(`/ingredients/${ingredient.ingredientId}`, ingredient);
    },

    deleteIngredient(ingredient) {
        return axios.delete(`/ingredients/${ingredient.ingredientId}`);
    },

    //meals

    getMeals() {
        return axios.get("/meals")
    },

    getMeal(mealId) {
        return axios.get(`/meals/${mealId}`)
    },

    addMeal(meal) {
        return axios.post('/meals', meal)
    },

    editMeal(meal) {
        return axios.put(`/meals/${meal.mealId}`, meal);
    },

    deleteMeal(meal) {
        return axios.delete(`/meals/${meal.mealId}`);
    },

    //steps

    getSteps() {
        return axios.get("/steps")
    },

    getStep(stepId) {
        return axios.get(`/steps/${stepId}`)
    },

    addStep(step) {
        return axios.post('/steps', step)
    },

    editStep(step) {
        return axios.put(`/steps/${step.stepId}`, step);
    },

    deleteStep(step) {
        return axios.delete(`/steps/${step.stepId}`);
    },

    //keywords
    getRecipesByKeyword(searchedWord) {
        return axios.get(`/keywords?keywords=${searchedWord}`)
    },

    //featured
    getRecipesByFeatured() {
        return axios.get('/featured')
    },


    //grocery list

    
    setUserToAnonymousUser(userId, privacy){
        return axios.put(`/users/${userId}/privacy`, privacy)
    }
    };