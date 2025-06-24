import { createRouter, createWebHistory } from "vue-router";
import register from "../views/register/index/Main.vue";
import login from "../views/login/index/Main.vue";
import Header from "../components/header/index/Main.vue";
import Home from '../views/home/index/Main.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),

  routes: [
    {
      path: "/",
      name: "header",
      component: Header,
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
      path: '/home',
      name: 'home',
      component: Home,
    }
  ],
});
export default router;
