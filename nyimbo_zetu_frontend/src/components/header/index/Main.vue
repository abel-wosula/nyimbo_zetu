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
        <div class="flex items-center lg:order-2">
          <a
            href="/login"
            class="text-gray-800 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-xs sm:text-lg px-2 lg:px-5 py-2 lg:py-2.5 mr-1 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
          >
            Log in
          </a>
          <a
            href="/register"
            class="text-gray-800 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-xs sm:text-lg px-2 lg:px-5 py-2 lg:py-2.5 mr-1 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
          >
            Sign Up
          </a>
          <a
            href="/profile"
            class="text-gray-800 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg hidden lg:block text-xs sm:text-lg px-2 lg:px-5 py-2 lg:py-2.5 mr-1 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
          >
            Profile
          </a>

          <!-- Toggle Button -->
          <button
            @click="toggleMenu"
            class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
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
            <li>
              <a
                href="team"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Team</a
              >
            </li>
            <li>
              <a
                href="contact"
                class="block py-2 pr-4 pl-3 text-gray-700 hover:text-indigo-600 dark:text-gray-400"
                >Contact</a
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
          class="text-gray-600 dark:text-gray-300 hover:text-red-500 absolute top-5 right-6"
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
        <button class="text-gray-300 justify-items-center">
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
              d="M5.121 17.804A9 9 0 0112 15a9 9 0 016.879 2.804M15 11a3 3 0 11-6 0 3 3 0 016 0z"
            />
          </svg>
          <span>Profile</span>
        </button>

        <!-- Links -->
        <ul class="mt-12 space-y-6 text-gray-800 dark:text-white font-semibold">
          <li><a href="/" @click="closeMenu">Home</a></li>
          <li><a href="#" @click="closeMenu">Songs</a></li>
          <li><a href="#" @click="closeMenu">Seasons</a></li>
          <li><a href="#" @click="closeMenu">Trending Songs</a></li>
          <li><a href="#" @click="closeMenu">Team</a></li>
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

const isOpen = ref(false);
const mobileMenu = ref(null);

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
  document.addEventListener("mousedown", handleClickOutside);
});

onUnmounted(() => {
  document.removeEventListener("mousedown", handleClickOutside);
});
</script>
