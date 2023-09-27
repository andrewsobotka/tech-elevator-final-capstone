<template>

  <div class="body">
    <div class="name-img-container">
      <div class="title-servings-combo">
        <h3><router-link v-bind:to="{name:'recipe', params:{id:recipe.recipeId}}">{{recipe.recipeName }}</router-link></h3>
        <div class="borderbox"></div>

        <div class="servings">Serving Size: {{ recipe.servingSize }}</div>
        <div class="description">
          <p>{{ recipe.recipeDescription }}</p>
        </div>
      </div>

      <div class="image"><img :src="recipe.image" /></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "recipeCard",
  props: {recipe:Object}

};
</script>

<style scoped>
.body {
  background: #fff;

  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 30%;
}
.title-servings-combo a {
  color:#333;
}
.borderbox {
  position: relative;
  margin-top: -30px;
  width: 19vw;
}

.servings {
  padding-top: 5px;
}

.name-img-container {
  display: flex;
  justify-content: space-between;
  gap: 1rem;
  /* position: relative;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  padding-bottom: 1rem;
  grid-template-areas: "title, title, image"; */
}
.image img {
  padding-top: 1.2rem;
  width: 200px;
  height: auto;
  max-height: 200px;
  z-index: 90;
}
</style>