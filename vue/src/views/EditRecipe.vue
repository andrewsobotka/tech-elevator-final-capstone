<template>
  <div id="container">
      <div>
      <EditRecipeForm/><br/>
      
      </div>
  </div>
</template>

<script>
import EditRecipeForm from '../components/EditRecipeForm.vue';
export default {
    components:{EditRecipeForm}

}
</script>

<style>
    #container{
        display: flex;
        justify-content: center;
    }

</style>