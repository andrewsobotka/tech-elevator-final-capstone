<template>
  <div>
      {{newRecipe}}
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Add New Recipe</h3>
      </div>
      <div class="label">
        <label for="recipeName">Title:</label>
      </div>
      <div class="field">
        <input type="text" name="recipeName" v-model="newRecipe.recipeName"/>
      </div>
      <div class="label">
        <label for="servingSize">Serving Size:</label>
      </div>
      <div class="field">
        <input type="text" name="servingSize" v-model="newRecipe.servingSize" />
      </div>
      <div class="label">
        <label for="description">Description:</label>
      </div>
      <div class="field">
        <textarea name="description" v-model="newRecipe.recipeDescription" />
      </div>
      <div class="label">
        <label for="quantity">Quantity:</label>
      </div>
      <div class="field">
        <input type="text" name="quantity" v-model="newRecipe.quantity" />
      </div>
      <div class="label">
        <label for="ingredient">Ingredient:</label>
      </div>
      <div class="field" v-for="(ingredient,index) in newRecipe.ingredients" v-bind:key="index">
        <input type="text" name="Ingredient" v-model="newRecipe.ingredients[index]" />
      </div>
      <div class="label">
        <label for="tags">Tags:</label>
      </div>
      <div class="field">
        <input type=checkbox id="tag" value="vegan" name="vegan" v-model="newRecipe.tags"/>
        <label for="vegan">Vegan</label>
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
    newRecipe: {
        quantity:[],
        ingredients:['', ''],
        tags:[]
      },
    };
  },
  methods: {
    createNewRecipe() {},
    addToTags(event){
        this.currentValue = event.target.checked.value;
        if(event.target.checked){
            this.newRecipe.tags.push(this.currentValue);
        } else if (!event.target.checked){
            this.newRecipe.tags.pop(this.currentValue);
        }
    }
  },
  computed:{

  }
};
</script>

<style>
</style>