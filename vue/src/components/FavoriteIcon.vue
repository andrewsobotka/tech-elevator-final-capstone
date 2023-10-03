<template>
  <button @click="$emit('toggle-favorites', recipe.id)"

   class="btn btn-sm btn-primary">
    <i
      :class="[favorite ? 'fa-heart favorite' : 'fa-heart-o', 'fa']"
      aria-hidden="true"
      @click="toggleColor"
    ></i>
  </button>
</template>

<script>
export default {
  date(){
    return {
      favorite:false
    };
  },
  methods:{
    toggleColor(){
      
    }
  },
  props: {
    
  },
emits: ['toggle-favorites'],

};
</script>

<style scoped>
.fa-heart {
  font-size: 3rem;
}

.fa {
  color: red;
}
</style>
