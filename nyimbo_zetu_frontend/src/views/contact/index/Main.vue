<template>
  <Header />
  <section class="bg-white dark:bg-gray-900">
    <div class="py-8 lg:py-16 px-4 mx-auto max-w-screen-md">
      <h2
        class="mb-4 text-4xl tracking-tight font-extrabold text-center text-gray-900 dark:text-white"
      >
        Talk To The Developers
      </h2>
      <p
        class="mb-8 lg:mb-16 font-light text-center text-gray-700 dark:text-gray-400 sm:text-xl"
      >
        Got a technical issue? Want to send feedback about a better feature?
        Need details about our Services? Let us know.
      </p>
      <h2 class="text-center text-gray-700 dark:text-gray-300 text-2xl p-5">
        Send Us Your Thoughts
      </h2>
      <form action="#" class="space-y-8">
        <div>
          <label
            for="email"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >Your email</label
          >
          <input
            type="email"
            id="email"
            class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="yourname@gmail.com"
            required
          />
        </div>
        <div>
          <label
            for="subject"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >Subject</label
          >
          <input
            type="text"
            id="subject"
            class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
            placeholder="Let us know how we can help you"
            required
          />
        </div>
        <div class="sm:col-span-2">
          <label
            for="message"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400"
            >Your message</label
          >
          <textarea
            id="message"
            rows="6"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Leave a comment..."
          ></textarea>
        </div>
        <button
          type="submit"
          class="py-3 px-5 text-sm font-medium text-center text-white rounded-lg bg-gray-700 sm:w-fit hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 cursor-pointer"
        >
          Send message
        </button>
      </form>
    </div>
    <div class="flex flex-col items-center justify-center p-4">
      <!-- Cards Container -->
      <div class="flex flex-wrap justify-center gap-4 w-full">
        <!-- First Card -->
        <div
          class="bg-gray-800 rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 w-full sm:w-[calc(50%-1rem)] md:w-[calc(33%-1rem)] lg:w-[calc(25%-1rem)] xl:w-[calc(20%-1rem)]"
        >
          <div class="p-4 sm:p-6 flex flex-col items-center text-center">
            <img
              src="../../../assets/android-chrome-512x512.png"
              alt="Stephen Vincent W."
              class="w-20 h-20 sm:w-24 sm:h-24 rounded-full object-cover border-4 border-blue-100"
            />
            <h2 class="mt-3 text-lg sm:text-xl font-bold text-gray-200">
              Stephen Vincent W.
            </h2>
            <p class="mt-1 text-sm sm:text-base text-gray-600">
              Full Stack Developer
            </p>

            <!-- Social Links -->
            <div class="mt-4 flex space-x-3">
              <a
                href="#"
                class="text-blue-800 hover:text-blue-700 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
              <a
                href="https://github.com/Iamvinnie254"
                target="_blank"
                class="text-gray-200 hover:text-gray-400 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
              <a
                href="#"
                class="text-blue-800 hover:text-blue-700 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    d="M12 0C8.02 0 4 4.02 4 8c0 3.535 2.195 6.547 5.25 7.77L9 24l3-8 3 8 1.75-8.23C17.805 14.547 20 11.535 20 8c0-3.98-4.02-8-8-8zm0 12c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4z"
                  />
                </svg>
              </a>
            </div>
          </div>
        </div>

        <!-- Second Card -->
        <div
          class="bg-gray-800 rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 w-full sm:w-[calc(50%-1rem)] md:w-[calc(33%-1rem)] lg:w-[calc(25%-1rem)] xl:w-[calc(20%-1rem)]"
        >
          <div class="p-4 sm:p-6 flex flex-col items-center text-center">
            <img
              src="../../../assets/android-chrome-512x512.png"
              alt="Developer 2"
              class="w-20 h-20 sm:w-24 sm:h-24 rounded-full object-cover border-4 border-blue-100"
            />
            <h2 class="mt-3 text-lg sm:text-xl font-bold text-gray-200">
              Abel Wafula W.
            </h2>
            <p class="mt-1 text-sm sm:text-base text-gray-600">
              Full Stack Developer
            </p>

            <!-- Social Links -->
            <div class="mt-4 flex space-x-3">
              <a
                href="#"
                class="text-blue-600 hover:text-blue-800 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
              <a
                href="https://github.com/Awafula"
                target="_blank"
                class="text-gray-200 hover:text-gray-300 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                    clip-rule="evenodd"
                  />
                </svg>
              </a>
              <a
                href="#"
                class="text-blue-500 hover:text-blue-700 transition-colors"
              >
                <svg
                  class="w-5 h-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path
                    d="M12 0C8.02 0 4 4.02 4 8c0 3.535 2.195 6.547 5.25 7.77L9 24l3-8 3 8 1.75-8.23C17.805 14.547 20 11.535 20 8c0-3.98-4.02-8-8-8zm0 12c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4z"
                  />
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <Footer />
</template>
<script setup>
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";
</script>
