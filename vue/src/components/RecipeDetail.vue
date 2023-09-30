<template>
  <div class="container">
    <h2>
      {{ recipe.recipeName }}
    </h2>

    <section class="servings">
      Serving size: {{ recipe.servingSize }} | Creator Name:
      {{ recipe.creatorId }}
    </section>

    <section class="description">
      <p>
        {{ recipe.description }}
      </p>
    </section>
    <h2>Ingredients</h2>
    <div class="ingredients-img-container">
      <div class="ingredients">
        <!-- where ID = XYZ v-for Data.Ingredients -->
        <ul>

          <li class="ingredient">• 13 seashells</li>
          <li class="ingredient">• 2 friends</li>
          <li class="ingredient">• 1/4 tbs green tea</li>
          <li class="ingredient">• 13 small rocks</li>
          <li class="ingredient">• 1lb sugar</li>
          <li class="ingredient">• 2 turtles</li>
          <li class="ingredient">• 1/4 tbs green tea</li>

          <li
            v-for="(ingredient, index) in recipe.ingredients"
            v-bind:key="index"
            class="ingredient"
          >
            • {{ ingredient.ingredient }}
          </li>
        </ul>
      </div>

      <div class="recipeImage">
        <!-- {{recipe.imgUrl}} -->

        <img :src="recipe.imgUrl" />
      </div>
    </div>

    <button class="steps-btn">
      Click Here to Follow the Instructions Step by Step
    </button>

    <div class="instructions">
      <h2>Instructions:</h2>
      <ol>
        <li
          class="steps"
          v-for="(step, index) in recipe.steps"
          v-bind:key="index"
        >
          Step {{ step.rank }}:
          {{ step.instruction }}

        </li>



        <li class="steps">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore,
          dolores!
        </li>
        <li class="steps">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex iusto,
          magnam aut iste amet rerum.
        </li>
        <li class="steps">Lorem, ipsum dolor. Lorem ipsum dolor sit amet.</li>
        <li class="steps">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed optio
          enim velit accusantium quo, magnam neque aut tempore omnis amet
          necessitatibus provident, maxime dicta? Eos aliquid provident, iste
          quos quam corrupti harum ducimus temporibus? Quam perferendis nobis
          architecto nulla! Quis, quisquam totam cupiditate quos quae nobis eius
          eos provident voluptatum, fugit dignissimos delectus dolorum quam
          itaque aperiam distinctio culpa perferendis?
        </li>

        <li class="steps">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur,
          provident quasi asperiores laborum odit ducimus quod explicabo aliquid
          eaque, recusandae, corporis quibusdam sequi incidunt ex?
        </li>



      </ol>
    </div>
  </div>
</template>


<script>
import APIService from "../services/APIService.js";
export default {
  name: "recipeDetail",

  methods: {
    addToLibrary() {},
  },
  created() {
    APIService.getRecipe(this.$route.params.id).then((response) => {
      this.$store.commit("SET_RECIPE", response.data);
    });
  },
  computed: {
    recipe() {
      return this.$store.state.recipe;
    },
  },
};
</script>

<style scoped>
.container {
  overflow: auto;
  display: flex;
  flex-direction: column;
  background: #fff;
  border-radius: 20px;
  border: 1px #333 solid;
  padding: 1.3rem;
  width: 70vw;
  max-width: 60rem;
  height: 90vh;
  margin: 1rem 2rem;
  overflow-y: scroll;
  padding-bottom: 5rem;
}
h2 {
  font-size: 1.4rem;
  width: 100%;

  border-bottom: 3px solid #444;
}
h3 {
  font-family: "Averia Serif Libre", cursive;
  text-transform: capitalize;
  letter-spacing: 1px;
  padding-bottom: 0.3rem;
  font-size: 1.5rem;
  border-bottom: 10px solid #55695659;
}
.servings {
  position: relative;
  text-align: right;
  font-family: "Montserrat";
  color: #555;
  font-size: 0.8em;
  margin-top: 3px;
}

.description {
  text-align: justify;
  padding: 0rem 0.5rem;
  font-family: "DM Sans", sans-serif;
  font-weight: 300;

}
p {
}

.ingredients {
  font-size: 1rem;
  font-family: "Montserrat", sans-serif;
  overflow: none;
  width: 15rem;
}
.ingredients-img-container {
  position: relative;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  padding-bottom: 1rem;
  height: 90rem;
}
.recipeImage img {
  padding-top: 10px;
  object-fit: cover;
  max-height: 30rem;
max-width: 30rem;
}

.steps-btn {
  font-family: "Montserrat", sans-serif;
  background: rgb(57, 82, 76);
  color: #fff;
  border-radius: 30px;
  border: 1px solid #333;
  font-size: 1rem;
  padding: 1.4%;
  float: right;
  margin: 0rem 0rem;
  transition: ease-in 0.4s;
}

.steps-btn:hover {
  background: #883410;
  /* background-image: url('https://t4.ftcdn.net/jpg/02/87/02/71/240_F_287027124_R2xwyI2l2ncGKFqy6JF3Izaue1xEWfMn.jpg'); */
  transition: ease-out 0.3s;
}

.instructions {
  font-size: 0.9rem;
  padding-right: 1.3rem;
  line-height: 2rem;
  font-family: "Lexend", sans-serif;
}

.instructions ol li:nth-child(odd) {
  color: rgb(170, 84, 84);
}
::-webkit-scrollbar {
  width: 10px;
  scroll-padding-right: 3rem;
}

/* Track */
::-webkit-scrollbar-track {
  background: rgb(224, 222, 207);
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #304b39e7;
  border-radius: 5px;
  scroll-padding-right: auto;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgb(111, 187, 130);
}
</style>