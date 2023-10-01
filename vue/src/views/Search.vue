<template>
  <div class="search">
    <h1>Search</h1>
    <p>Search results for "{{ $store.state.keyword }}"</p>
    <p>Showing {{$store.state.filteredList.length}} {{$store.state.filteredList.length == 1 ? 'Result' : 'Results'}}</p>
    <div v-if="$store.state.keyword !=''">
      <RecipeCard
        v-for="recipe in $store.state.filteredList"
        v-bind:key="recipe.recipeId"
        v-bind:recipe="recipe"
      />
      
    </div>
  </div>
</template>

<script>
import APIService from "../services/APIService.js";
import RecipeCard from "../components/RecipeCard.vue";

export default {
  components: { RecipeCard },
  data() {
    return {
      // search:""
      results: [],
      resultNumber: 0,
    };
  },
  created() {
    let searchWord = this.$store.state.keyword;
    APIService.getRecipesByKeyword(searchWord).then((response) => {
      this.$store.commit("SET_FILTERED", response.data);
      this.results = this.$store.state.filteredList;
      this.resultsNumber = this.$store.state.filteredList.length();
    });
  },

  methods: {},
  computed: {
    numberOfResults() {
      return this.resultsNumber;
    },
  },
};
</script>

<style scoped>
</style>