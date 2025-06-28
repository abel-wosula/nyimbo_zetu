import { createRouter, createWebHistory } from "vue-router";
import Register from "../views/register/index/Main.vue";
import Login from "../views/login/index/Main.vue";
import Home from "../views/home/index/Main.vue";
import Upload from "../views/upload/index/Main.vue";
import Profile from "../views/profile/index/Main.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),

  routes: [
    {
      path: "/",
      name: "home",
      component: Home,
    },
    {
      path: "/register",
      name: "register",
      component: Register,
    },
    {
      path: "/login",
      name: "login",
      component: Login,
    },
    {
      path: "/upload",
      name: "upload",
      component: Upload,
      meta: { requiresAuth: true },
    },
    {
      path: "/profile",
      name: "profile",
      component: Profile,
    },
  ],
});
export default router;
