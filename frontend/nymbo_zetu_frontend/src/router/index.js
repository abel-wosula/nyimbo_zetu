import { createRouter, createWebHistory } from "vue-router";
import Register from "../views/register/index/Main.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/register",
      name: "register",
      component: Register,
    },
  ],
});
export default router;
