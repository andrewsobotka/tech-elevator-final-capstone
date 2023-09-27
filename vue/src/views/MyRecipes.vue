<template>

 <div class="cardsContainer">
    <h3>My Recipes</h3>
<div class="borderbox"></div>
    <div class="recipesList">
     <RecipeCard
      v-for="recipe in myRecipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
 </div></div>
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
.cardsContainer{

}
.recipesList {
 margin-top: 3rem;
  display: flex; 
  flex-wrap: wrap;
  position: relative;
  gap: .3rem;
 justify-content: center;
}


h3{
text-align: center;
font-size: 2.5rem
;
}

.borderbox{
  width: 50%;
  position: relative;
 left: 25%;
}



</style>