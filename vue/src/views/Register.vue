<template>
  <div id="register" class="text-center body" >
    <form @submit.prevent="register" class = "title-serving-combo">
      <h3>Create Account</h3>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
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
      <button type="submit" class="login-btn">Create Account</button>
      <p><router-link :to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
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
  margin: auto;
  margin-top: 3rem;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 40%;
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
</style>