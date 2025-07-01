<template>
  <Header />
  <div
    class="w-full max-w-7xl mx-auto p-4 bg-gray-100 border border-gray-200 rounded-lg shadow-sm dark:bg-gray-800 dark:border-gray-700"
  >
    <div class="flex flex-col items-center pb-10">
      <label class="cursor-pointer relative">
        <img
          class="w-24 h-24 mb-3 rounded-full shadow-lg object-cover"
          :src="user.profileImage"
          alt="User Image"
        />
        <input
          type="file"
          accept="image/*"
          class="absolute inset-0 opacity-0 cursor-pointer"
          @change="handleImageChange"
        />
        <span
          class="absolute bottom-0 right-0 text-xs text-white bg-black bg-opacity-50 px-2 py-0.5 rounded"
        >
          Change
        </span>
      </label>

      <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">
        {{ user.first_name }} {{ user.last_name }}
      </h5>
      <span class="text-sm text-gray-500 dark:text-gray-400">
        {{ user.email }}
      </span>
    </div>
    <div class="max-w-md mx-auto mt-8 p-6 bg-white rounded-lg shadow-md">
      <h2 class="text-2xl font-semibold mb-4">Profile Information</h2>
      <div class="flex flex-wrap gap-4">
        <div class="flex-1">
          <label
            for="first_name"
            class="block mb-1 text-sm font-medium text-gray-700"
            >First Name</label
          >
          <input
            disabled
            type="text"
            id="first_name"
            name="first_name"
            class="w-full border border-gray-300 rounded-md p-2"
          />
        </div>

        <div class="flex-1">
          <label
            for="last_name"
            class="block mb-1 text-sm font-medium text-gray-700"
            >Last Name</label
          >
          <input
            type="text"
            id="last_name"
            name="last_name"
            class="w-full border border-gray-300 rounded-md p-2"
          />
        </div>

        <div class="flex-1">
          <label
            for="email"
            class="block mb-1 text-sm font-medium text-gray-700"
            >Email</label
          >
          <input
            type="email"
            id="email"
            name="email"
            class="w-full border border-gray-300 rounded-md p-2"
          />
        </div>
      </div>
    </div>
    <div class="mt-8">
      <h3 class="text-xl font-semibold mb-4">My Uploaded Songs</h3>
      <table class="w-full bg-white rounded shadow text-sm">
        <thead class="bg-gray-100 font-semibold">
          <tr>
            <th class="p-3 text-left">Title</th>
            <th class="p-3 text-left">Composer</th>
            <th class="p-3 text-left">Artist</th>
            <th class="p-3 text-left">Lyrics</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="song in songs" :key="song.id">
            <td class="p-3">{{ song.title }}</td>
            <td class="p-3">{{ song.composer }}</td>
            <td class="p-3">{{ song.artists }}</td>
            <td class="p-3">{{ song.lyrics }}</td>
          </tr>
          <tr v-if="songs.length === 0">
            <td colspan="4" class="p-3 text-center text-gray-500">
              No songs found.
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script setup>
import { ref, onMounted, watch } from "vue";
import Header from "@/components/header/index/Main.vue";
import { useQuery } from "@vue/apollo-composable";
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";

const user = ref({
  id: "",
  email: "",
  first_name: "",
  last_name: "",
  profileImage: "",
});

const songs = ref([]);
const songPage = ref(1);
const songTotalPages = ref(1);

// Set up the query only after user is loaded
const userLoaded = ref(false);

// Fetch songs only when user is ready
const {
  result: userSongsResult,
  refetch: refetchUserSongs,
  onResult: onUserSongsResult,
  loading,
} = useQuery(
  CREATE_SONG,
  () => ({
    songsSearch: { search: "" }, // Wrap in songsSearch if your server expects that
    page: songPage.value,
    first: 10,
    user_id: user.value.id, // 👈 Ensure this is what your backend expects
  }),
  {
    enabled: false, // 🚫 prevent auto-fetch until user is loaded
    fetchPolicy: "network-only",
  }
);

// Watch for when user is loaded and trigger fetch
watch(
  () => user.value.id,
  (newID) => {
    if (newID) {
      userLoaded.value = true;
      refetchUserSongs(); // 👈 Trigger the query
    }
  }
);

// Handle the result

// Load user info on mount
onMounted(() => {
  const storedUser = localStorage.getItem("user");
  if (storedUser) {
    try {
      const parsed = JSON.parse(storedUser);
      user.value = {
        ...parsed,
        profileImage:
          parsed.profileImage ||
          "https://flowbite.com/docs/images/people/profile-picture-5.jpg",
      };
    } catch (error) {
      console.error("Error parsing user data", error);
    }
  }
});

const handleImageChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      user.value.profileImage = reader.result;
      // Optionally update localStorage
      const storedUser = JSON.parse(localStorage.getItem("user"));
      localStorage.setItem(
        "user",
        JSON.stringify({
          ...storedUser,
          profileImage: reader.result,
        })
      );
    };
    reader.readAsDataURL(file);
  }
};

onUserSongsResult((result) => {
  console.log("GraphQL result:", result); // 👀 Check here
  songs.value = result?.data?.songs?.data || [];
});
watch(
  () => user.value.id,
  async (newID) => {
    if (newID) {
      console.log("User ID is ready, refetching songs for ID:", newID);
      await refetchUserSongs(); // just trigger the query
    }
  }
);
watch(userSongsResult, (result) => {
  console.log("Songs result from watch:", result);
  songs.value = result?.songs?.data || [];
});
</script>
