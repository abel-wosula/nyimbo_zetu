import { createRouter, createWebHistory } from "vue-router";
import Register from "../views/register/index/Main.vue";
import Login from "../views/login/index/Main.vue";
import Home from "../views/home/index/Main.vue";
import Upload from "../views/upload/index/Main.vue";
import Profile from "../views/profile/index/Main.vue";
import Featuring from "../views/featuring/index/Main.vue";
import Contact from "../views/contact/index/Main.vue";
import Seasons from "../views/seasons/index/main.vue"
import Analytics from "../views/analytics/index/Main.vue"

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
      path: "/profile",
      name: "profile",
      component: Profile,
      children: [
        {
          path: "upload",
          name: "upload",
          component: Upload,
          meta: { requiresAuth: true },
        },
      ],
    },
    {
      path: "/featuring",
      name: "featuring",
      component: Featuring,
    },
    {
      path: "/seasons",
      name: "Seasons",
      component: Seasons,
    },
    {
      path: "/analytics",
      name: "Analytics",
      component: Analytics,
    },
    {
      path: "/contact",
      name: "contact",
      component: Contact,
    },
  ],
});
export default router;
