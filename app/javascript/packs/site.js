import Vue from "vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import App from "../App.vue";
import router from "../router";
import i18n from "../i18n";
import Vuex from "vuex";
import BootstrapVue from "bootstrap-vue";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

Vue.use(Vuetify);
Vue.use(Vuex);
Vue.use(BootstrapVue);

const vuetify = new Vuetify();

Vue.config.productionTip = process.env.NODE_ENV == "production";

document.addEventListener("DOMContentLoaded", () => {
  // router.beforeEach(Vue.prototype.$auth.authRedirectGuard());
  // TODO: move this part to different package
  Vue.prototype.$auth = {
    accessTokenField: "access-token",
    setAccessToken(token) {
      localStorage.setItem(this.accessTokenField, token);
    },
    clearAccessToken() {
      localStorage.setItem(this.accessTokenField, null);
    },
    getAccessToken() {
      let storedToken = localStorage.getItem(this.accessTokenField);

      if (storedToken != null) {
        this.parseJwt(storedToken);
        return storedToken;
      } else {
        return null;
      }
    },
    checkAuthenticated() {
      try {
        this.parseJwt(localStorage.getItem(this.accessTokenField));
        return true;
      } catch (error) {
        return false;
      }
    },
    parseJwt(token) {
      let base64Url = token.split(".")[1];
      let base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
      let jsonPayload = decodeURIComponent(
        atob(base64)
          .split("")
          .map(function(c) {
            return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
          })
          .join("")
      );

      return JSON.parse(jsonPayload);
    },
  };

  router.beforeEach((to, from, next) => {
    // redirect to sign-in page if not logged in and trying to access a restricted page
    const authRequired = to.matched.some((record) => record.meta.authRequired);
    const loggedIn = Vue.prototype.$auth.checkAuthenticated();

    if (authRequired && !loggedIn) {
      return next("/users/login");
    }

    next();
  });

  const app = new Vue({
    router,
    i18n,
    vuetify,
    render: (h) => h(App),
  }).$mount("#app");

  document.body.appendChild(app.$el);
});
