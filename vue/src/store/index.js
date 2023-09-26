import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    recipes:[
      {
        recipeId:1,
        recipeName: "Cheese Pizza",
        recipeDescription: "Cheese, Sauce, and Crust. It's always good. Make it.",
        servingSize: 4, 
        ingredients: ["mozzerella cheese", "dough", "sauce"],
        steps: ["Set the oven to 375 degrees.", "Roll out your dough.", "Spread the sauce on the dough.","Sprinkle on the cheese on.", "Bake for 15 minutes."]
      },
      {
        recipeId:2,
        recipeName: "Sourdough Bread",
        recipeDescription: "It's not actually sour, but it is bread.",
        servingSize: 6, 
        ingredients: ["yeast", "flour", "water","salt"],
        steps: ["Set the oven to 375 degrees.", "Mix wet ingredients.", "Slowly add dry ingredients", "Let bread sit for an hour to rise.", "Put dough in oven and bake for 1 hour."]
      },
      {
        recipeId:3,
        recipeName: "Spaghetti",
        recipeDescription: "Delicious red tomato sauce and amazing spaghetti.",
        servingSize: 2, 
        ingredients: ["pasta", "tomato sauce", "parmesan cheese"],
        steps: ["Boil water", "Put pasta in boiling water and cook for 10 minutes or until al dente", "Put the sauce on."]
      },

    ]
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    }
  }
})
