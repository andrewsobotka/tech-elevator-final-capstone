<!-- NavigationMenu.vue -->
<template>
  <div class="navigation-menu">
    <button @click="toggleDropdown">
      {{ selectedPage ? selectedPage.label : 'Menu' }}
      </button>

    <div class="overlay">
    <ul v-if="isDropdownOpen" class="overlay-content">
      <li v-for="page in pages" :key="page.name">
        <router-link :to="{ name: page.name }" 
        @click="closeDropdown">
        {{ page.label }}
        </router-link>
      </li>
    </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isDropdownOpen: false,
      selectedPage: null,
      pages: [
        { label: 'Home', name: 'home' },
        { label: 'Explore Recipes', name: 'recipes' },
        { label: 'My Recipes', name: 'my-recipes' },
        // Add more pages as needed
      ],
    };
  },
  methods: {
    toggleDropdown() {
      this.isDropdownOpen = !this.isDropdownOpen;
    },
    closeDropdown() {
      this.isDropdownOpen = false;
    },
  },
};
</script>

<style scoped>
.navigation-menu {
  display: inline-block;
  position: relative;
}

.overlay {
    height: 100%;
      width: 0;
      position: fixed;
      z-index: 1;
      top: 0;
  }

.overlay-content {
  position: relative;
  top: 80px;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}


ul {
  list-style-type: none;
  padding: 0;
  top: 100%;
  left: 0;
  background-color: #fff;
  border: 1px solid #ccc;
  z-index: 13;
}

button{
  border-radius: 0;
  border: .4px solid #555;
  padding: .6rem 1.4rem; 
  transition: ease .8s;
  background-color: rgb(43, 143, 39);
}
button:hover{
  color:rgb(255, 255, 255);
  background-color: rgb(12, 68, 5);
}
li {
  padding: 10px;
  border-bottom: 1px solid #ccc;
  width: 150px;
  background-color: gray;
}

li:last-child {
  border-bottom: none;
}
</style>
