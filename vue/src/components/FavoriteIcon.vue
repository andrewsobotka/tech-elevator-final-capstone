<template>
    <button class="btn btn-sm btn-primary" v-on:click="togglefav" >
      
      <i v-bind:class="[is_fav ?  'fa-heart' : 'fa-heart-o', 'fa']" aria-hidden="true"></i>
      
      </button>
    <!-- <button class="btn btn-sm btn-primary" v-on:click="togglefav" ><i v-bind:class="[is_fav ?  'fa-bookmark' : 'fa-bookmark-o', 'fa']" aria-hidden="true"></i></button> -->



</template>

<script>
export default {
  props: {
    favorited: Boolean,
  },
  methods: {
    toggleFavorite() {
      this.$emit("togglefav", !this.favorited);
    },
  },
};
</script>
<style scoped>
.fa-heart{
 font-size: 3rem;
}

.favorite{
  color: red;
}
</style>