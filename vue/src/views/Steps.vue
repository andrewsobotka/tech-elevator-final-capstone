<template>
  <div>
      <Ingredients/>
      <Step/>
  </div>
</template>

<script>
import Ingredients from '../components/Ingredients.vue';
import Step from '../components/Step.vue'
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
.popup{
  position:fixed;
  top:0;
  left:0;
  right:0;
  bottom:0;
  z-index: 99;
  background-color: rgba(0,0,0,0.2);

  display: flex;
  align-items:center;
  justify-content: center;

  
}
.popup-inner{
    background: #fff;
    padding:32px;
  }
</style>