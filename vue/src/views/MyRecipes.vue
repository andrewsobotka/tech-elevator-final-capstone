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
.body {
 
  display: inline-flex;
  justify-content: center;
  /* border-radius: 30px;
  border: 2px solid #333; */
  width: auto;
  height: auto;
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 30%;
}
.title-servings-combo a {
  color:#333;
}
.borderbox {
  position: relative;
  margin-top: -30px;
  width: 19vw;
}

.servings {
  padding-top: 5px;
}
</style>