import "./assets/main.css";

import { createApp } from "vue";
import router from "./router";
import App from "./App.vue";

import { provideApolloClient } from "@vue/apollo-composable";
import { apolloClient } from "./apollo.default_client.config.js";
provideApolloClient(apolloClient);
const app = createApp(App);

app.use(router);
app.mount("#app");
