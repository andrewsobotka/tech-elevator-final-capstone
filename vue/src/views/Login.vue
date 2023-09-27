<template>
<div id="container">
  <div id="login" class="body">
    <form @submit.prevent="login" class = "title-serving-combo">
      <h2 >Please Sign In</h2>
      <div id= "alert" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <div id="submit-button">
      <button type="submit">Sign in</button>
      </div>
      <div id="register">
      <p id="sign-up"> 
      <router-link :to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
      </div>
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
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
.form-input-group {
  margin-bottom: 1rem;
  display: flex;
  justify-content: center;
}
label {
  margin-right: 0.5rem;
}
.body {
  background: #fff;

  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 30%;
  display: flex;
  justify-content: center;
}

.title-servings-combo a {
  color:#333;
}

label{
  font-family: "Montserrat";
}

#sign-up a {
  color:#333;
  font-family: "Montserrat";
}

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

#alert{
  color:red;
  font-family: "Montserrat";
  display: flex;
  justify-content: center;
  padding-bottom: .5rem;
}
</style>