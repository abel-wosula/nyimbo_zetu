<template>
  <Header />
  <section class="bg-gray-100 dark:bg-gray-900 h-full">
    <div
      class="flex flex-col items-center justify-center px-4 py-6 mx-auto md:h-screen h-screen lg:py-0"
    >
      <a
        href="#"
        class="flex items-center mb-8 text-2xl font-semibold text-gray-900 dark:text-white"
      >
        <img
          class="w-8 h-8 mr-2"
          src="../../../assets/android-chrome-512x512.png"
          alt="logo"
        />
        Login
      </a>
      <div
        class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700"
      >
        <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
          <h1
            class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white"
          >
            Sign in to your account
          </h1>
          <form class="space-y-4 md:space-y-6" @submit.prevent="handleLogin">
            <div>
              <label
                for="email"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Your email</label
              >
              <input
                v-model="form.email"
                type="email"
                name="email"
                id="email"
                class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="name@gmail.com"
                required=""
              />
            </div>
            <div>
              <label
                for="password"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Password</label
              >
              <input
                v-model="form.password"
                autocomplete="current-password"
                type="password"
                name="password"
                id="password"
                placeholder="••••••••"
                class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required=""
              />
            </div>
            <div class="flex items-center justify-between">
              <div class="flex items-start">
                <div class="flex items-center h-5">
                  <input
                    id="remember"
                    aria-describedby="remember"
                    type="checkbox"
                    class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800"
                    required=""
                  />
                </div>
                <div class="ml-3 text-sm">
                  <label for="remember" class="text-gray-500 dark:text-gray-300"
                    >Remember me</label
                  >
                </div>
              </div>
              <a
                href="/reset_password"
                class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500"
                >Forgot password?</a
              >
            </div>
            <button
              type="submit"
              :disabled="loading"
              class="w-full text-dark bg-blue-400 hover:bg-blue-200 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
            >
              {{ loading ? "Logging in..." : "Log in" }}
            </button>
            <p class="text-sm font-light text-gray-500 dark:text-gray-400">
              Don’t have an account yet?
              <a
                href="/register"
                class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                >Sign up</a
              >
            </p>
          </form>
        </div>
      </div>
    </div>
  </section>
  <Footer />
</template>

<script setup>
import { ref, reactive } from "vue";
import { useRouter } from "vue-router";
import { useMutation } from "@vue/apollo-composable";
import { LOGIN_USER } from "@/graphql/Mutations/userLogin.js";
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";

const router = useRouter();

const form = ref({
  email: "",
  password: "",
});
const loading = ref(false);
const { mutate: userLogin, onDone, onError } = useMutation(LOGIN_USER);
const handleLogin = async () => {
  try {
    if (!form.value.email || !form.value.password) {
      alert("Please fill in all fields");
      return;
    }

    const { data } = await userLogin({
      email: form.value.email,
      password: form.value.password,
    });

    console.log("Login response:", data);

    const token = data?.userLogin?.token;
    const user = data?.userLogin?.user;

    if (!token || !user) {
      alert("Invalid credentials or missing token/user");
      return;
    }

    // ✅ Save both token and user
    localStorage.setItem("token", token);
    localStorage.setItem("user", JSON.stringify(data.userLogin.user));

    // ✅ Redirect to profile
    alert("Login successful!");
    router.push("/profile");
  } catch (error) {
    console.error("Login error:", error);
    alert("Login failed: " + error.message);
  }
};

onDone(({ data }) => {
  localStorage.setItem("auth_token", data.userLogin.token);
  localStorage.setItem("user_data", JSON.stringify(data.userLogin.user));
  window.dispatchEvent(new Event("storage")); // to trigger update
  router.push("/profile");
});
onError((error) => {
  console.error("Login failed:", error.message);
  // store user id
  localStorage.setItem("token", data.userLogin.token);
  localStorage.setItem("user", JSON.stringify(data.userLogin.user)); // store user
});
</script>
