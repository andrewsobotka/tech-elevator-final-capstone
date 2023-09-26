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
        ingredients: ["1 cup mozzarella cheese", "1/2 pound dough", "1 jar of sauce"],
        steps: ["Set the oven to 375 degrees.", "Roll out your dough.", "Spread the sauce on the dough.","Sprinkle on the cheese on.", "Bake for 15 minutes."],
        image:"https://plus.unsplash.com/premium_photo-1672198597143-45a4b5f064c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" 
      },
      {
        recipeId:2,
        recipeName: "Sourdough Bread",
        recipeDescription: "It's not actually sour, but it is bread.",
        servingSize: 6, 
        ingredients: ["1 tsp. yeast", "1 cup flour", "3 tbsp. water","1/2 tsp. salt"],
        steps: ["Set the oven to 375 degrees.", "Mix wet ingredients.", "Slowly add dry ingredients", "Let bread sit for an hour to rise.", "Put dough in oven and bake for 1 hour."],
        image:"https://plus.unsplash.com/premium_photo-1661770191552-90e12a9c41aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
        
      },
      {
        recipeId:3,
        recipeName: "Spaghetti",
        recipeDescription: "Delicious red tomato sauce and amazing spaghetti.",
        servingSize: 2, 
        ingredients: ["1 box of pasta", "1 jar of tomato sauce", "3 tbsp. parmesan cheese"],
        steps: ["Boil water", "Put pasta in boiling water and cook for 10 minutes or until al dente", "Put the sauce on."],
        image: "https://images.unsplash.com/photo-1627042633145-b780d842ba45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
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
