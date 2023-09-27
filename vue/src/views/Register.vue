<template>
<div id="container">
  <div id="register" class="text-center body" >
    <form @submit.prevent="register" class = "title-serving-combo">
      <div id ="title">
      <h2>Create Account</h2>
      </div>
      <div id="alert" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div id=form-container>
      <div class="form-input-group">
        <label for="username">Username: </label>
        <input type="text" id="username" class="inputbox" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password: </label>
        <input type="password" class="inputbox" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password:</label> 
        <input type="password" id="confirmPassword" class="inputbox" v-model="user.confirmPassword" required />
      </div>
      </div>
      <div id ="bottom">
      <button type="submit">Create Account</button>
      </div>
      <div class="login-link">
      <p id="login-link">
        Already have an account?
        <router-link :to="{ name: 'login' }"  > Log in.</router-link></p>
      </div>
    </form>
  </div>
</div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>

.form-input-group {
  text-align: center;
  margin-bottom: 1rem;
  align-items: center;
  position: relative;
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
  width: cal;
  height: auto;
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 30%;
  display: flex;
  justify-content: center;
  text-align:center;
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
border-bottom: 1px solid #333;
border: none;
font-family: 'DM Sans', sans-serif;

}
#sign-up a {
  color: #333;
  font-family: "Montserrat";
}

.title-servings-combo a {
  color:#333;
  font-family: "Montserrat";
}

#container{
  display: flex;
  justify-content: center;
}

button{
 margin-top: 30px;
  font-size: 1rem;
  background-color: rgba(55, 133, 65, 0.842);
  color: #fff;
  font-family: 'Lexend', sans-serif;
  padding: .4rem 1rem;
  border-radius: 33px;
}

button:hover{
  background-color: rgba(86, 144, 126, 0.808);
  border-color: rgba(86, 144, 126, 0.808);
}

p a{
  color:#333;
  font-family: "Montserrat";
}

#bottom{
  display:flex;
  justify-content: center;
}

.form-input-group{
  display:flex;
  justify-content: center;
}

.login-link{
  display: flex;
  justify-content:center;
  color: #333;
  font-family: "Montserrat";
}

.login-link a:hover{
  color: rgb(89, 148, 0);
}

#form-container{
  justify-content: center;
}

#alert{
  color:red;
  font-family: "Montserrat";
  display: flex;
  justify-content: center;
  padding-bottom: .5rem;
}



</style>
