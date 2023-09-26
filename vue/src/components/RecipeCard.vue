<template>
  <div class="body">
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

.body{
  
  background: #fff;
  border-radius: 20px;
  border: 1px #333 solid;
  padding: 1.3rem;
  width: 30%;
  height: 70vh;
  margin: 1rem 2rem;
  overflow-y: scroll;

}



</style>