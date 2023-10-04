<template>
  <div>
    
    <button @click="goBack">Back</button>
  </div>
</template>


<script>
export default {
  methods: {
    goBack() {
      this.$router.go(-1);
    }
  }
};
</script>

<style scoped>

</style>
