<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <img src="../../images/Myproject2.png" alt="White Board">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <button id="sign-in-button" type="submit">Sign in</button>
    </form>
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
            this.$store.state.workingUser = response.data.user;
            response.data.user.authorities.forEach(authority => {
              if (authority.name == 'ROLE_ADMIN') {
                this.$store.state.isAdmin = true;
                this.$store.state.isManager = true;
                this.$router.push({name: 'AHome'})
              }
              else if(authority.name == 'ROLE_MANAGER') {
                this.$store.state.isManager = true;
                this.$store.state.isUser = true;
                this.$router.push({name: 'AHome'});
              }
              else {
                this.$store.state.isUser = true;
                this.$router.push({name: 'UserHome', params: {userId: response.data.user.id}})
              }
            })
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

<style>


#login {
  display: flex;
  align-items: center;
  justify-content: space-around;
  height: 100vh;
  background-image: url('../../images/background.jpg');
}

#sign-in-button {
  margin-top: 10px;
  max-width: 6rem;
}

/* #login::before {
    content: '';
    position: absolute;
    top: 0px;
    right: 0px;
    bottom: 0px;
    left: 0px;
    background-image: url('../../images/background.jpg');
    opacity: .3;
} */
.form-signin {
  width: 33%;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  row-gap: 5px;
  border-radius: 10px;
  padding: 15px;
  box-shadow: 2px 2px, #ffff;
  background-color: rgb(255, 255, 255);
  position: relative;
}



img {
  transition: transform 250ms;
}

/* img:hover { */
  /* transform: translateY(-10px); */
  /* transform: rotate3d(0, -1, 1, 360deg);
} */

form > h1 {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-size: 25px;
  background-color: rgb(255, 255, 255);
  margin-top: .5px;
  margin-bottom: 10px;
  padding: 0, px, 0, 5px;
  border-radius: 10px;
  text-align: center;
}

</style>
