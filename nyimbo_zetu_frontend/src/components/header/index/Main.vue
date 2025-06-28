<template>
  <header class="sticky top-0 z-[8888]">
    <nav class="bg-white border-gray-200 px-4 lg:px-6 py-2.5 dark:bg-gray-800">
      <div
        class="flex flex-wrap justify-between items-center mx-auto min-w-xs max-w-screen-xl"
      >
        <!-- Logo -->
        <a href="/" class="flex items-center">
          <img
            src="../../../assets/android-chrome-512x512.png"
            class="mr-3 h-6 rounded-full sm:h-9"
            alt="Nyimbo Zetu"
          />
          <span
            class="self-center sm:text-xl text-xs font-semibold whitespace-nowrap dark:text-white"
          >
            Nyimbo Zetu
          </span>
        </a>

        <!-- Action Buttons -->
        <div class="flex items-center md:gap-6 gap-0.5 md:order-2">
          <div>
            <button
              @click="handleUserLogin"
              class="flex items-center gap-2 text-xs md:text-lg px-2 py-2 text-white bg-blue-500 rounded-md hover:bg-blue-600 transition-colors cursor-pointer"
            >
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
              </svg>
              Upload Song
            </button>
          </div>

          <!-- profile section ONLY VISIBLE WHEN LOGGED IN -->
          <div
            v-if="loggedIn"
            class="items-center gap-5 dark:text-white hidden lg:flex"
          >
            <div class="flex items-center gap-2">
              <a
                href="/profile"
                class="w-10 h-10 rounded-full overflow-hidden ring-2 ring-gray-300 dark:ring-white focus:outline-none focus:ring-4 focus:ring-blue-500"
              >
                <img
                  :src="userProfileImage"
                  alt="Profile"
                  class="w-full h-full object-cover"
                />
              </a>
              <span>Hello, {{ user.last_name }}</span>
            </div>
          </div>
          <!-- Toggle Button -->
          <button
            @click="toggleMenu"
            class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600 cursor-pointer"
          >
            <svg
              v-if="!isOpen"
              class="w-6 h-6"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path
                fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd"
              />
            </svg>
            <svg v-else class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
              <path
                fill-rule="evenodd"
                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                clip-rule="evenodd"
              />
            </svg>
          </button>
        </div>

        <!-- Desktop Menu -->
        <div
          class="hidden justify-between items-center w-full lg:flex lg:w-auto lg:order-1"
        >
          <ul
            class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0"
          >
            <li>
              <a
                href="/"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Home</a
              >
            </li>
            <li>
              <a
                href="/songs"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Songs</a
              >
            </li>
            <li>
              <a
                href="/seasons"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Seasons</a
              >
            </li>
            <li>
              <a
                href="trending"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Trending Songs</a
              >
            </li>
          </ul>
        </div>
      </div>

      <!-- Mobile Slide-in Menu -->
      <div
        v-show="isOpen"
        ref="mobileMenu"
        class="fixed top-0 right-0 w-64 h-full bg-white dark:bg-gray-900 shadow-lg z-50 p-6 transform transition-transform duration-300"
        :class="isOpen ? 'translate-x-0' : 'translate-x-full'"
      >
        <!-- X Button -->
        <button
          class="text-gray-600 dark:text-gray-300 hover:text-red-500 absolute top-5 right-6 cursor-pointer"
          @click="toggleMenu"
        >
          <svg
            class="w-6 h-6"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>

        <!-- Profile section on mobile view -->

        <template v-if="loggedIn">
          <div class="flex items-center gap-2 dark:text-white mb-6">
            <a
              href="/profile"
              class="block w-10 h-10 rounded-full overflow-hidden ring-2 ring-gray-300 dark:ring-white focus:outline-none focus:ring-4 focus:ring-blue-500"
            >
              <img :src="userProfileImage" class="w-full h-full object-cover" />
            </a>
            <span>Hello, {{ user.last_name }}</span>
          </div>
        </template>

        <!-- Links -->
        <ul class="mt-12 space-y-6 text-gray-800 dark:text-white font-semibold">
          <li><a href="/" @click="closeMenu">Home</a></li>
          <li><a href="#" @click="closeMenu">Songs</a></li>
          <li><a href="#" @click="closeMenu">Seasons</a></li>
          <li><a href="#" @click="closeMenu">Trending Songs</a></li>
          <li><a href="#" @click="closeMenu">Contact</a></li>
        </ul>
      </div>

      <!-- Overlay -->
      <div
        v-if="isOpen"
        class="fixed inset-0 bg-black bg-opacity-50 z-40"
        @click="closeMenu"
      ></div>
    </nav>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();
const isOpen = ref(false);
const mobileMenu = ref(null);
const loggedIn = ref(false);
const userProfileImage = ref("");
const user = ref("");

const initializeAuthState = () => {
  const token = localStorage.getItem("token");
  const userData = localStorage.getItem("user");

  loggedIn.value = token !== null;

  if (loggedIn.value && userData) {
    try {
      const user = JSON.parse(userData);
      user.value = user.name || "User";
      userProfileImage.value =
        user.profileImage || "../../../assets/android-chrome-192x192.png";
    } catch (e) {
      console.error("Error parsing user data:", e);
    }
  }
};

// Redirect for upload
const handleUserLogin = () => {
  if (loggedIn.value) {
    router.push("/upload");
  } else {
    router.push("/login");
  }
};
const toggleMenu = () => {
  isOpen.value = !isOpen.value;
};

const closeMenu = () => {
  isOpen.value = false;
};

const handleClickOutside = (event) => {
  if (mobileMenu.value && !mobileMenu.value.contains(event.target)) {
    closeMenu();
  }
};

onMounted(() => {
  const storedUser = localStorage.getItem("user_data");
  if (storedUser) {
    try {
      user.value = JSON.parse(storedUser);
    } catch (e) {
      console.error("Invalid user data", e);
    }
  }
});

onMounted(() => {
  initializeAuthState();

  // Optional: Watch for storage changes if needed
  window.addEventListener("storage", initializeAuthState);
  onMounted(() => {
    document.addEventListener("mousedown", handleClickOutside);
  });

  onUnmounted(() => {
    document.removeEventListener("mousedown", handleClickOutside);
  });
});
</script>
