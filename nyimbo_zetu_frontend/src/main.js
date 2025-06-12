import './assets/main.css'
import router from './router'

import { createApp } from 'vue'
import App from './App.vue'

import { provideApolloClient } from '@vue/apollo-composable'
import apolloClient from './apollo.default_client.config.js'
provideApolloClient(apolloClient)

createApp(App).mount('#app')

const app = createApp(App)
app.use(router)
app.mount('#app')

