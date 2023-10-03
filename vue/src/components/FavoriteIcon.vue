<template>
  <button @click="$emit('toggle-favorites', recipe.recipeId)"

   class="btn btn-sm btn-primary">
    <i
      :class="[recipe.favorite ? 'fa-heart favorite' : 'fa-heart-o', 'fa']"
      aria-hidden="true"
    ></i>
  </button>
</template>

<script>
export default {
  date(){
    return {

    };
  },
<<<<<<< HEAD
  props: {    recipe: Object

=======
  methods:{
    toggleColor(){
      
    }
  },
  props: {
>>>>>>> 2c13b9e3136569c6040ab010d264e449cce353ad
    
  },
emits: ['toggle-favorites'],
methods:{}
};
</script>

<style scoped>
.fa-heart {
  font-size: 3rem;
}

.favorite {
  color: red;
}
</style>
