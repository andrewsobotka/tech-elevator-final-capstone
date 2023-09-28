<template>
  <div class="recipe-details"> 
      <recipe-details v-bind:recipe="recipeDetails"/>
  </div>
</template>

<script>
import RecipeDetails from "../components/RecipeDetail.vue"
export default {
    components:{RecipeDetails},
    computed:{
        recipeDetails(){
            let someRecipe= this.$store.state.recipes.find((recipe) => {
                return recipe.recipeId == this.$route.params.id})
                ;
                return someRecipe;
        }
    },
     created(){
    
  }


}
</script>

<style>
    .recipe-details{
        display: flex;
        justify-content: center;
    }

</style>