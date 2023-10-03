<template>
  <div class="container">
    <div class="header-favorite-group">
      <FavoriteIcon
        :recipe="recipe"
        @toggle-favorites="toggleFavorites"
        :class="{ favorite: recipe.favorite, notFavorite: !recipe.favorite }"
      />
      <h2>
        {{ recipe.recipeName  }}
      </h2> 
      
     

    </div>
    <section class="servings">
      Serving size: {{ currentRecipe.servingSize }} | Creator Name:
      {{ currentRecipe.creatorId }}
    </section>

    <section class="description">
      <p>
        {{ currentRecipe.description }}
      </p>
    </section>
    <h2>Ingredients</h2>
    <div class="ingredients-img-container">
      <div class="ingredients">
        <!-- where ID = XYZ v-for Data.Ingredients -->
        <ul>
          <li
            v-for="(ingredient, index) in currentRecipe.ingredients"
            v-bind:key="index"
            class="ingredient"
          >
            • {{ ingredient.ingredient }}
          </li>
        </ul>
      </div>

      <div class="recipeImage">
        <img :src="currentRecipe.imgUrl" />
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
          v-for="(step, index) in currentRecipe.steps"
          v-bind:key="index"
        >
          Step {{ step.rank }}:
          {{ step.instruction }}
        </li>
      </ol>
      <router-link
        v-bind:to="{ name: 'edit-recipe', params: { id: recipe.recipeId } }"
        v-if="
          $store.state.user.id === recipe.creatorId ||
          $store.state.user.authorities[0].name == 'ROLE_ADMIN'
        "
        ><button>Edit Recipe</button></router-link
      >
      <button class="delete-btn">Delete Recipe</button>
    </div>
  </div>
</template>


<script>
import APIService from "../services/APIService.js";
import FavoriteIcon from "./FavoriteIcon.vue";

export default {
  name: "recipeDetail",
  props: ["recipe"],
  components: {
    FavoriteIcon,
  },
  methods: {
    addToLibrary() {},
    deleteRecipe() {
      let choice = confirm("Are you sure that you want to delete this?");
      if (choice === true) {
        APIService.deleteRecipe(this.$route.params.id)
          .then((response) => {
            console.log(response);
            this.$router.push("/recipes");
          })
          .catch((error) => {
            if (error.response) {
              window.alert("Bad Request");
            } else if (error.request) {
              window.alert("Could not reach service");
            }
          });
      }
    },
    toggleFavorites() {
      this.$store.commit("FLIP_FAVORITE", this.recipe);
    },
  },
  created() {
    APIService.getRecipe(this.$route.params.id).then((response) => {
      this.$store.commit("SET_RECIPE", response.data);
    });
  },
<<<<<<< HEAD
  computed:{
    currentRecipe(){
      return this.$store.state.recipe;
    },
=======
  computed: {
    // recipe(){
    // return this.$store.state.recipe;
    // this.
    // },
>>>>>>> 62be09d806cf3c64b0768015b1a30e038316b4aa
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

.favorite {
 border: none;
  padding: 6px;
  position: relative;
  top: -10px;
  right: -10px;
  background: transparent;
  font-size: 2rem;
  transition: 0.3s ease;
  
  margin: 0;
  z-index: 39;
  
}


.notFavorite {
 border: none;
  padding: 6px;
  position: relative;
  top: -10px;
  right: -10px;
  background: transparent;
  font-size: 2rem;
  transition: 0.3s ease;
  margin: 0;
   z-index: 39;
}

.header-favorite-group {
  display: flex;
  flex-direction: row-reverse;
  justify-content: flex-start;
}

.description {
  text-align: justify;
  padding: 0rem 0.5rem;
  font-family: "DM Sans", sans-serif;
  font-weight: 300;
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

.delete-btn a {
  color: #fff;
}

.delete-btn:hover {
  background: #7a2217;
}
</style>  