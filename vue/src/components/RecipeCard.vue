<template>
  <div class="cardContainer">
   <RecipeDetail/>

  </div>


</template>

<script>
import RecipeDetail from './RecipeDetail.vue'


export default {
    name: 'recipeCard',
  props:{

  },
  components: {
    RecipeDetail,
    
  }

}
</script>

<style>

.cardContainer{
  background: #fff;
  border-radius: 20px;
  border: 1px #333 solid;

}




</style>