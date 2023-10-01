<template>
  <div class="container">

    {{selectCheckBox}}
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Edit Recipe</h3>
      </div>
      <div class="field">
        <label for="recipeName">Title: </label>
        <input
          type="text"
          name="recipeName"
          v-model="editRecipe.recipeName"
          placeholder="ie: Apple Crumble"
        />
      </div>
      <br />
      <div class="field">
        <label for="servingSize">  Serving Size:</label>
        <input
          type="text"
          name="servingSize"
          v-model="editRecipe.servingSize"
          placeholder="ie: 6"
        />
      </div>
      <br />
      <div class="field">
        <label for="description">Description: </label>
        <textarea name="description" v-model="editRecipe.description" />
      </div>

      <div class="ingredientList">
        <label for="ingredient">Ingredients:</label>
        <button class="ingredients-btn">
          <a v-on:click="editRecipe.ingredients.push('')">Add Ingredient</a>
        </button>

        <br />

        <ul>
          <li
            v-for="(ingredient, index) in editRecipe.ingredients"
            v-bind:key="index"
            class="ingredientList"
          >
            <div class="ingredients-check-group">
              

              <input
                type="text"
                name="Ingredient"
                class="ingredients-input"
                placeholder="ie. Apples"
                v-model="ingredient.ingredient"
                @keyup.enter="ingredient.ingredient.push('')"
              />

              <input
                type="checkbox"
                id="step"
                class="ingredient-checkbox"
                v-bind:key="index"
                v-bind:value="index"
                v-model="indexOfIngredients"
              />
            </div>
          </li>
        </ul>     </div>


        <div class="deleteDiv">
          <button class="delete-btn">
            <a v-on:click="deleteIngredients">Delete Selected Ingredients</a>
          </button>
   
      </div>

      <div class="stepsList">
          <ol>
          <label for="ingredient" class="stepsLabel">Steps:</label>
          <button class="ingredients-btn addSteps-btn">
            <a v-on:click="editRecipe.steps.push('')">Add Step</a>
          </button>
          <br />
          <br />

          <li v-for="(step, index) in editRecipe.steps" v-bind:key="index">
            <div class="ingredients-check-group">

              <input
                type="text"
                class="steps-input"
                placeholder="ie: Gather Ingredients..."
                v-model="step.instruction"
                @keyup.enter="editRecipe.steps.push('')"
              />
              <input
                type="checkbox"
                id="step"
                v-bind:key="index"
                v-bind:value="index"
                v-model="indexOfSteps"
              />
            </div>
          </li>    </ol>  </div>


          <div class="deleteDiv">
            <button class="delete-btn">
              <a v-on:click="deleteSteps">Delete Selected Steps</a>
            </button>
        
    
      </div>

      <label for="tags">Tags:</label>
      <div class="tagsList">
        <div
          class="field"
          v-for="(tag, index) in $store.state.listOfTags"
          v-bind:key="index"
        >
          <input
            type="checkbox"
            id="tag"
            v-bind:value="tag"
            v-bind:name="tag"
            v-model="editRecipe.tags"
          />
          <label for="tagLabel">{{ tag.tag }}</label>
        </div>
      </div>

      <div class="submitDiv">
        <button type="submit" value="Submit New Recipe" class="submit-btn">
          Submit New Recipe
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import APIService from "../services/APIService.js";
export default {
  data() {
    return {
      currentValue: 0,
      indexOfSteps: [],
      indexOfIngredients: [],
      editRecipe: {
        ingredients: [],
        steps: [],
        tags: [],
      },
    };
  },
  methods: {
    createNewRecipe() {},
    deleteIngredients() {
      let newArray = [];
      for (let i = 0; i < this.editRecipe.ingredients.length; i++) {
        if (!this.indexOfIngredients.includes(i)) {
          newArray.push(this.editRecipe.ingredients[i]);
        }
      }
      this.editRecipe.ingredients = newArray;

      this.indexOfIngredients = [];
    },
    deleteSteps() {
      let newArray = [];
      for (let i = 0; i < this.editRecipe.steps.length; i++) {
        if (!this.indexOfSteps.includes(i)) {
          newArray.push(this.editRecipe.steps[i]);
        }
      }
      this.editRecipe.steps = newArray;

      this.indexOfSteps = [];
    }
  },
  computed: {
    recipe(){
      return this.$store.state.recipe;
    }
  },
  created() {
    APIService.getRecipe(this.$route.params.id).then((response) => {
      this.$store.commit("SET_RECIPE", response.data);
      this.editRecipe = this.$store.state.recipe;
    });
    
  }
};
</script>

<style scoped>
.container {
  max-width: 21rem;
  display: flex;
  flex-direction: column;
  width: 100%;
  cursor: pointer;
}
div a {
  color: #333;
}

textarea {
  position: relative;
  width: 20rem;
  height: 10rem;
  background-color: #d9e9fa;
  border: none;
  font-family: "Montserrat", sans-serif;
  font-size: 1rem;
  letter-spacing: 1.5px;
  color: rgba(14, 0, 0, 0.623);
  margin: 10px 0;
}

input::placeholder {
  font-family: "Montserrat", sans-serif;
  padding: 6px;
  color: rgba(119, 119, 119, 0.623);
}

input[name="recipeName"] {
  margin-top: 0.7rem;
  width: 95%;
}

.ingredientList li {
  list-style-type: none;
}

input[name="servingSize"] {
  width: 5rem;
  margin-left: 1rem;
}

.addSteps-btn {
  position: relative;
  left: 15%;
}

.stepsLabel {
  margin-left: 1rem;
  position: relative;
  left: -3.3rem;
}

.field ul li {
  list-style-type: none;
}

.ingredients-btn {
  margin-left: 20%;
  background: rgb(228, 243, 187);
  border-radius: 0;
  position: relative;
}

.steps-btn {
  margin-left: 60px;
  transition: ease 0.5s;
}

.ingredients-check-group {
  display: flex;
  margin-bottom: 1rem;
  position: relative;
  left: -2.5rem;
  justify-content: left;
}

.ingredients-input{
    position: relative;
  width: 20rem;
  margin-left: 1rem;
}
.steps-input {
  position: relative;
  width: 20rem;
  margin-left: 3rem;
}


.delete-btn {
  background: rgb(206, 74, 74);
  color: #fff;

  font-size: 0.8rem;

  transition: ease 0.5s;
}

.deleteDiv{
  position: relative;
   display: flex;
  justify-content: center;
  left: -.5rem;
  margin: 1rem;
 
}



.delete-btn a {
  color: #fff;
}

.delete-btn:hover {
  background: #7a2217;
}
.submitDiv{
  display: flex;
  justify-content: center;
}

.submitDiv button {
  background: rgba(115, 202, 198, 0.623);
  border-radius: 0;
  color: rgb(39, 2, 2);
  font-family: "Montserrat", sans-serif;
  font-weight: bold;

  transition: ease 0.5s;
}
.submit-btn:hover {
  background: rgb(63, 133, 98);
  color: #fff;
}

.tagsList {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  margin: 1rem 0;
}

.tagsList input, .tagsList label{
  margin: .2rem;
  margin-bottom: 1rem;
  text-align: center;
}

li{
    font-family: "Montserrat";
    text-justify: top;
}

ul{
  color:#333;
}

</style>
