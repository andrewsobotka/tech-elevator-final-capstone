<template>

 <div class="cardsContainer">
    <h3>My Recipes</h3>
     <RecipeCard
      v-for="recipe in myRecipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
 </div>
</template>

<script>
import RecipeCard from '../components/RecipeCard.vue';

export default {
  name: 'RecipeList',
  components: {RecipeCard},
  computed:{
    myRecipes() {
      return this.$store.state.recipes.filter((recipe) => {
        return recipe.creatorUsername == this.$store.state.user.username;
      });
    }}

}

</script>

<style scoped>

</style>