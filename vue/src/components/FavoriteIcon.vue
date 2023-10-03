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
  props: {    recipe: Object

    
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
