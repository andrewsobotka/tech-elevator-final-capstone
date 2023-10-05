<template>
  <div>
      <div id= "container">
      <Step @hideStep="$emit('hideStep')"/>
      </div>
  </div>
</template>

<script>
import Step from '../components/StepBox.vue'
import APIService from "../services/APIService.js";

export default {
components:{Step},
created() {
    APIService.getRecipe(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_RECIPE", response.data);
    });
}
}
</script>

<style scoped>
  div{
    position: fixed;
    width: 100%;
    height: 100vh;
  }
  

</style>