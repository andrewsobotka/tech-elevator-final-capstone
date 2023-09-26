<template>
  <div class="cardContainer">
   <recipeDetail>

  </div>


</template>

<script>
import recipeDetail from '../src/components/RecipeDetail.vue'

export default {
    name: 'recipeCard',
  props:{

  },
  components: {
    recipeDetail,
    
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