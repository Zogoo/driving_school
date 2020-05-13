import Vue from "vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import App from "../App.vue";
import router from "../router";
import i18n from "../i18n";

Vue.use(Vuetify);
const vuetify = new Vuetify();

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    router,
    i18n,
    vuetify,
    render: (h) => h(App),
  }).$mount("#app");
  document.body.appendChild(app.$el);
});
