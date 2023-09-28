<template>
  <div>
    <div>
      <h2  id="meals-title">My Meals</h2>
      <p>Search by Tag:
        <tagSelectBox/> </p>
    </div>
  </div>
</template>

<script>
import tagSelectBox from '../components/tagSelectBox.vue';

export default {
  components: {
    tagSelectBox
  }
};
</script>

<style>

#meals-title {
  display: flex;
  justify-content: center;
}


</style>