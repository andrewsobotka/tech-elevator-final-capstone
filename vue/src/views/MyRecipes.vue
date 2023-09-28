<template>

 <div class="cardsContainer">
    <h3>My Recipes <br>
      <button v-on:click="showForm=!showForm">{{showForm? "Hide Form" : "Add Recipe"}}</button>
    </h3>
<div class="borderbox"></div>
    <div class="recipesList">
     <RecipeCard
      v-for="recipe in myRecipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
     <div>
       <NewRecipeForm v-if="showForm===true"/>
     </div>
 </div></div>
</template>

<script>
import NewRecipeForm from '../components/NewRecipeForm.vue';
import RecipeCard from "../components/RecipeCard.vue";

export default {
  name: "RecipeList",
  data(){
    return{
      showForm:false
    }
  },
  components: { RecipeCard, NewRecipeForm },
  computed: {
    myRecipes() {
      return this.$store.state.recipes.filter((recipe) => {
        return recipe.creatorUsername == this.$store.state.user.username;
      });
    },
  },
};
</script>

<style scoped>

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