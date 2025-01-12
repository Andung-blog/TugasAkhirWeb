import { createApp } from "vue";
import App from "./App.vue";
import router from "./router"; // Import the router
import "../css/app.css"; // Make sure this points to the correct location of the compiled Tailwind CSS

// Create and mount the Vue app
createApp(App)
    .use(router) // Use the router
    .mount("#app");
