<template>
  <div class="explore">
    <h3>My Meals</h3>
    <div class="borderbox"></div>
  </div>
</template>

<script>
export default {
  name: "My-Meals",
  components: {},
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