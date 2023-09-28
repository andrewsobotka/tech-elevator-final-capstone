<template>
  <div>
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Add New Recipe</h3>
      </div>
      <div class="field">
        <label for="recipeName">Title:</label>
        <input type="text" name="recipeName" v-model="newRecipe.recipeName" />
      </div>
      <br />
      <div class="field">
        <label for="servingSize">Serving Size:</label>
        <input type="text" name="servingSize" v-model="newRecipe.servingSize" />
      </div>
      <br />
      <div class="field">
        <label for="description">Description:</label><br />
        <textarea name="description" v-model="newRecipe.recipeDescription" />
      </div>
      <div class="field">
        <label for="ingredient">Ingredients:</label><br />
        <a v-on:click="newRecipe.ingredients.push('')">Add Ingredient</a><br />
        <li
          v-for="(ingredient, index) in newRecipe.ingredients"
          v-bind:key="index"
        >
          <input
            type="text"
            name="Ingredient"
            v-model="newRecipe.ingredients[index]"
            @keyup.enter="newRecipe.ingredients.push('')"
          />
          <input
            type="checkbox"
            id="step"
            v-bind:key="index"
            v-bind:value="index"
            v-model="indexOfIngredients"
          />
          <br /><br />
        </li>
        <a v-on:click="deleteIngredients">Delete Ingredients</a>
      </div>
      <div class="field">
        <ol>
          <label for="steps">Steps:</label
          ><br />
          <a v-on:click="newRecipe.steps.push('')">Add Step</a
          ><br />
          <li v-for="(step, index) in newRecipe.steps" v-bind:key="index">
            <input
              type="text"
              name="steps"
              v-model="newRecipe.steps[index]"
              @keyup.enter="newRecipe.steps.push('')"
            />
            <input
              type="checkbox"
              id="step-checkbox"
              v-bind:key="index"
              v-bind:value="index"
              v-model="indexOfSteps"
            />
            <br /><br />
          </li>
          <a v-on:click="deleteSteps">Delete Steps</a
          ><br />
        </ol>
      </div>
      <label for="tags">Tags:</label>
      <div class="field" v-for="(tag, index) in listOfTags" v-bind:key="index">
        <input
          type="checkbox"
          id="tag"
          v-bind:value="tag"
          v-bind:name="tag"
          v-model="newRecipe.tags"
        />
        <label for="vegan">{{ tag }}</label>
      </div>
      <button type="submit" value="Submit New Recipe" class="btn save">
        Submit New Recipe
      </button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentValue: 0,
      listOfTags: [
        "breakfast",
        "lunch",
        "dinner",
        "vegan",
        "dairy-free",
        "keto",
      ],
      indexOfSteps: [],
      indexOfIngredients: [],
      newRecipe: {
        quantity: [],
        ingredients: [""],
        steps: [""],
        tags: [],
      },
    };
  },
  methods: {
    createNewRecipe() {},
    deleteIngredients() {
      let newArray = [];
      for (let i = 0; i < this.newRecipe.ingredients.length; i++) {
        if (!this.indexOfIngredients.includes(i)) {
          newArray.push(this.newRecipe.ingredients[i]);
        }
      }
      this.newRecipe.ingredients = newArray;

      this.indexOfIngredients = [];
    },
    deleteSteps() {
      let newArray = [];
      for (let i = 0; i < this.newRecipe.steps.length; i++) {
        if (!this.indexOfSteps.includes(i)) {
          newArray.push(this.newRecipe.steps[i]);
        }
      }
      this.newRecipe.steps = newArray;

      this.indexOfSteps = [];
    }, 
  },
  computed: {},
};
</script>

<style>
div a {
  color: #333;
}

textarea {
  position: relative;
  width: 20rem;
  height: 10rem;
  background-color: #d9e9fa;
}

</style>
