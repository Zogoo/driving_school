import Vue from "vue"
import VueRouter from "vue-router";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/",
      component: () => import("./views/Home"),
      meta: { authRequired: true },
    },
    {
      path: "/student/my_page",
      component: () => import("./views/Login"),
    }
  ],
});
