<template>
  <div class="container">
    <h3>
      {{ recipe.recipeName }}
    </h3>
    <div class="borderbox"></div>

    <div class="desc-serve">
      <section class="description">
        <p>
          {{ recipe.recipeDescription }}
        </p>
      </section>

      <section class="servings">
        Serving Size: {{ recipe.servingSize }} | Created By:
        {{ recipe.creatorUsername }}
      </section>
    </div>

    <div class="ingredients-img-container">
      <div class="ingredients">
        <!-- where ID = XYZ v-for Data.Ingredients -->
        <h4>Ingredients</h4>
        <ul>
          <li
            v-for="(ingredient, index) in recipe.ingredients"
            v-bind:key="index"
            class="ingredient"
          >
            {{ ingredient }}
          </li>
        </ul>
      </div>
      <img :src="recipe.image" class="detail-img" />
    </div>

    <div class="instructions">
      <button class="steps-btn">
        Click Here to Follow the Instructions Step by Step
      </button>
      <h2>Instructions:</h2>

      <ol>
        <li
          class="steps"
          v-for="(step, index) in recipe.steps"
          v-bind:key="index"
        >
          {{ step }}
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  name: "recipeDetail",
  props: {
    recipe: Object,
  },
};
</script>
<style>
  .ingredients-img-container {
    position: relative;
    display: flex;
    padding-bottom: 1.5rem;
  }
 
  .instructions li {
    font-size: 1.2rem;
  }



  .desc-serve {
    display: flex;
  }


 /* image properties for WITHIN Recipe */
  .detail-img {
    position: relative;
    width: 50vw;
    max-height: 60vh;
    object-fit: cover;
    margin-left: 3rem;
  }

@media only screen and (max-width: 780px) {
  .borderbox {
    position: relative;
    margin-top: 0%;
  }

  .detail-img {
    width: auto;
    height: 30vh;
    position: relative;
    margin-left: 0px;
  }
  .ingredients-img-container {
    display: flex;
    flex-direction: column-reverse;
  }

  .steps-btn {
    padding: 3%;
    font-size: 13px;
    align-content: start;
    margin-bottom: 3rem;
  }


  h3,
  h2 {
    font-size: 2rem;
    margin-bottom: 0.2rem;
  }
  .servings {
    margin: 3px 0px;
  }
}
</style>