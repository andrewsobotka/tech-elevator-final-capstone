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
      <img :src="recipe.imgUrl" class="detail-img" />
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
    <!-- v-on:click="addToLibrary" v-if="recipes.recipeId.includes(recipe.recipeId)" -->
    <button>Add to My Recipes</button>
    <!-- //this is just here so I can check the edit link 

    v-if="recipe.creatorUserName===$store.state.user.username"
    
    -->
    <router-link v-bind:to="{name:'edit-recipe', params:{id:recipe.recipeId}}"><button>Edit Recipe</button></router-link>

    
    
  </div>
</template>

<script>
export default {
  name: "recipeDetail",
  props: {
    recipe: Object,
  },
  methods:{
    addToLibrary(){

    }
  }
};
</script>
<style scoped>

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

@media only screen and (width < 780px) {
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
    font-size: 1rem;
    margin-bottom: 3rem;
    text-align: center;
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

@media only screen and (width > 780px) {
  .container{
    width:60%;
  }
  
}
</style>