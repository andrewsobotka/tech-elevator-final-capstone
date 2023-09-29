<template>
  <div class="grocery">
    <FoodList/>
  </div>  
</template>

<script>
import FoodList from '../components/FoodList.vue';

export default {
  name: "My-Meals",
  components: {FoodList},
};
</script>

<style scoped>
h3 {
  text-align: center;
  text-decoration: none;
  font-size: 2.5rem;
}
.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
}

.cardsContainer {
  margin: 2rem;
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: 0.3rem;
  justify-content: center;
}
</style>