<template>
<div id="container">
  <div id="login" class="body">
<<<<<<< HEAD
    <form @submit.prevent="login" class="title-serving-combo">
      <h3>Please Sign In</h3>
      <div role="alert" v-if="invalidCredentials">
=======
    <form @submit.prevent="login" class = "title-serving-combo">
      <h2 >Please Sign In</h2>
      <div id= "alert" role="alert" v-if="invalidCredentials">
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username: </label>
        <input 
          type="text"
          id="username" class="inputbox" 
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div class="form-input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="user.password" class="inputbox" required />
      </div>
<<<<<<< HEAD
      <button type="submit" class="login-btn">Login</button>
      <p id="sign-up">
        Need an account?
        <router-link :to="{ name: 'register' }"> Sign up.</router-link>
      </p>
=======
      <div id="submit-button">
      <button type="submit">Sign in</button>
      </div>
      <div id="register">
      <p id="sign-up"> 
      <router-link :to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
      </div>
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
    </form>
  </div>
</div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style scoped>
.form-input-group {
  text-align: center;
  margin-bottom: 1rem;
<<<<<<< HEAD
  align-items: center;
  position: relative;
=======
  display: flex;
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
  justify-content: center;
}
label {
  margin-right: 0.5rem;
}

.login-btn{
    margin-top: 30px;

  font-size: 1rem;
  background-color: rgba(55, 133, 65, 0.842);
  color: #fff;
font-family: 'Lexend', sans-serif;
  padding: .4rem 1rem;
  border-radius: 33px;
  
}
.body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
<<<<<<< HEAD
  margin: auto;
  margin-top: 3rem;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 40%;
=======
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 30%;
  display: flex;
  justify-content: center;
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
}



.title-servings-combo a {
  color: #333;
}

label {
  font-family: "Montserrat";
}

input{
border-radius: 2px;
font-size: 1rem;
background-color: #d9e9fa;
border: none;
padding: 8px;
font-family: 'DM Sans', sans-serif;

}
#sign-up a {
  color: #333;
  font-family: "Montserrat";
}
<<<<<<< HEAD
=======

#container{
  display: flex;
  justify-content: center;
}

button{
  font-family: "Montserrat";
  border-radius: 30px;
   background-color: rgba(0, 53, 36, 0.808);
   color: #fff;
}

button:hover{
  background-color: rgba(86, 144, 126, 0.808);
  border-color: rgba(86, 144, 126, 0.808);
}

#submit-button{
  display:flex;
  justify-content: center;
}

#register{
  display: flex;
  justify-content: center;
}

#register a:hover{
  color: rgb(89, 148, 0);
}

>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
</style>