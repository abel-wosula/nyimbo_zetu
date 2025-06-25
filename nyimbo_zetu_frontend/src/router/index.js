import { createRouter, createWebHistory } from "vue-router";
import register from "../views/register/index/Main.vue";
import login from "../views/login/index/Main.vue";
import Home from "../views/home/index/Main.vue";
import upload from "../views/upload/index/Main.vue"
import profile from "../views/profile/index/Main.vue"

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
      component: register,
    },
    {
      path: "/login",
      name: "login",
      component: login,
    },
    {
      path: '/upload',
      name: 'upload',
      component: upload
    },
    {
      path: '/profile',
      name: 'profile',
      component: profile
    }
  ],
});
export default router;
