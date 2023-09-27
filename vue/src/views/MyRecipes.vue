<template>

<<<<<<< HEAD
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
=======
    <div id="my-recipes" >
      <div id ="recipe">
      <h2 id="recipe-title">My Recipes</h2>
      </div>
      <div class="cardsContainer">
      <RecipeCard
        v-for="recipe in myRecipes"
        v-bind:key="recipe.recipeId"
        v-bind:recipe="recipe"
      />
      </div>
    </div>
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue";

export default {
  name: "RecipeList",
  components: { RecipeCard },
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
.cardsContainer{
<<<<<<< HEAD

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


=======
  /* margin: 2rem; */
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: .3rem;
  justify-content: center;
}
#my-recipes{
  text-align: center;
}
#recipe-title {
  display: flex;
  justify-content: center;
  text-align: center;
}


>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664

</style>