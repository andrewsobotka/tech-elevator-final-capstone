<template>
  <div>
      <Ingredients/>
      <Step/>
  </div>
</template>

<script>
import Ingredients from '../components/Ingredients.vue';
import Step from "../components/Step.vue"
import APIService from "../services/APIService.js";

export default {
components:{Step, Ingredients},
created() {
    APIService.getRecipe(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_RECIPE", response.data);
    });
}
}
</script>

<style>

</style>