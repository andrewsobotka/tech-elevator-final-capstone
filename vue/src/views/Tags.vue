<template>
  <div>
      <Tags/>
  </div>
</template>

<script>
import APIService from "../services/APIService";

import Tags from "../components/Tags.vue"
export default {
    components:{Tags},
     method:{
    addTag(){
        APIService.addTag(this.newTag).then((response) =>{
          if (response.status === 201){
              this.$router.push('/recipes')
          }
        }
      ).catch(
        (error) => {
          if(error.response) {
              window.alert('Bad Request');
          } else if(error.request) {
              window.alert('Could not reach service');
          }
        }
      );
    },
  }

}
</script>

<style>

</style>