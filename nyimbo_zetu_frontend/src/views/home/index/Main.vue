<template>
  <Header activeLink="profile" />

  <div class="bg-gray-200 p-4 mx-auto min-h-screen">
    <!-- Profile Info -->
    <div class="flex flex-col items-center pb-10 mx-auto max-w-screen-sm">
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

    <!-- Songs Table -->
    <div class="grid grid-cols-12 gap-1">
      <div class="col-span-12 p-4 overflow-x-auto">
        <div class="w-full">
          <table class="w-full text-sm bg-blue-200 rounded-lg">
            <thead class="border-b border-gray-600 font-semibold bg-slate-300">
              <tr>
                <th class="p-3 text-left">Song Title</th>
                <th class="p-3 text-left">Composer</th>
                <th class="p-3 text-left">Artist/Choir</th>
                <th class="p-3 text-left">Lyrics</th>
                <th class="p-3 text-left">Midi</th>
                <th class="p-3 text-left">Score Sheet</th>
                <th class="p-3 text-left">Youtube Link</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="loadingSongs">
                <td colspan="7" class="py-5 text-center">Loading music records...</td>
              </tr>
              <tr v-else-if="songs.length === 0">
                <td colspan="7" class="py-5 text-center">No music records found</td>
              </tr>
              <tr
                v-else
                v-for="(song, index) in songs"
                :key="index"
                class="border-b border-opacity-20 hover:bg-blue-100 transition-colors"
              >
                <td class="px-2 py-4">{{ song.title }}</td>
                <td class="px-2 py-4">{{ song.composer }}</td>
                <td class="px-2 py-4">{{ song.artists }}</td>
                <td
                  class="px-2 py-4 cursor-pointer"
                  @click="showLyrics(song.lyrics, song.title)"
                >
                  {{ truncateLyrics(song.lyrics) }}
                </td>
                <td class="px-2 py-4">
                  <audio controls class="w-48 p-2">
                    <source :src="getFullUrl(song.midi)" />
                    Your browser does not support the audio element.
                  </audio>
                </td>
                <td class="px-2 py-4">
                  <a
                    :href="getFullUrl(song.pdf)"
                    class="px-4 py-2 text-white bg-blue-500 hover:bg-blue-700 rounded transition-colors"
                    download
                  >
                    Download PDF
                  </a>
                </td>
                <td class="px-2 py-4">
                  <a
                    v-if="song.ytlink"
                    :href="song.ytlink"
                    target="_blank"
                    class="text-blue-500 hover:underline"
                  >
                    Watch on YouTube
                  </a>
                  <span v-else class="text-gray-500">N/A</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Pagination -->
    <div class="col-span-12 mt-4 pb-5">
      <Pagination
        :currentPage="currentPage"
        :totalPages="totalPages"
        @page-changed="fetchSongs"
      />
    </div>

    <!-- Lyrics Modal -->
    <div
      v-if="showLyricsDialog"
      class="fixed inset-0 z-50 bg-gray-800/80 flex items-center justify-center"
      @click.self="showLyricsDialog = false"
    >
      <div class="bg-white rounded-lg p-6 max-w-2xl w-full max-h-[80vh] flex flex-col">
        <div class="flex justify-between items-center mb-4 flex-shrink-0">
          <h3 class="text-xl font-semibold">{{ currentSongTitle }} - Lyrics</h3>
          <button @click="showLyricsDialog = false" class="text-gray-500 hover:text-gray-700">
            ✕
          </button>
        </div>
        <div class="flex-1 overflow-y-auto whitespace-pre-wrap">{{ currentLyrics }}</div>
        <div class="mt-4 flex justify-end flex-shrink-0">
          <button @click="showLyricsDialog = false" class="px-4 py-2 bg-gray-200 rounded-md mr-2">Close</button>
          <button @click="copyLyrics" class="px-4 py-2 bg-blue-500 text-white rounded-md">Copy</button>
        </div>
      </div>
    </div>

    <!-- Toast -->
    <transition name="fade">
      <div v-if="toastMessage" class="fixed top-4 right-4 bg-green-500 text-white px-6 py-3 rounded shadow-lg z-[9999]">
        {{ toastMessage }}
      </div>
    </transition>

  </div>

  <Footer />
</template>

<script setup>
import { ref, reactive, onMounted } from "vue";
import { useQuery } from "@vue/apollo-composable";
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";
import Pagination from "@/components/pagination/Main.vue";
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";

// Base API
const baseUrl = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";

// User info
const user = ref({
  id: "",
  email: "",
  first_name: "",
  last_name: "",
  profileImage: "",
});

// Songs state
const songs = ref([]);
const currentPage = ref(1);
const totalPages = ref(1);
const loadingSongs = ref(false);

// Lyrics modal
const showLyricsDialog = ref(false);
const currentLyrics = ref("");
const currentSongTitle = ref("");

// Toast
const toastMessage = ref("");

// Fetch songs query
const { onResult, onError, refetch } = useQuery(
  CREATE_SONG,
  () => ({
    songsSearch: { search: "" },
    page: currentPage.value,
    first: 10,
    user_id: user.value.id, // fetch songs of this user
  }),
  { fetchPolicy: "network-only", enabled: false } // disabled auto-fetch
);

// Load user and fetch songs
onMounted(() => {
  const storedUser = JSON.parse(localStorage.getItem("user") || "{}");
  user.value = {
    ...storedUser,
    profileImage: storedUser.profileImage || "https://flowbite.com/docs/images/people/profile-picture-5.jpg",
  };

  if (user.value.id) fetchSongs();
});

// Fetch songs function
const fetchSongs = (page = 1) => {
  currentPage.value = page;
  loadingSongs.value = true;
  refetch({
    songsSearch: { search: "" },
    page: page,
    first: 10,
    user_id: user.value.id,
  }).finally(() => (loadingSongs.value = false));
};

// Handle query results
onResult((result) => {
  songs.value = result.data?.songs?.data || [];
  totalPages.value = result.data?.songs?.paginatorInfo?.lastPage || 1;
});

onError((error) => {
  console.error("GraphQL Error:", error);
  songs.value = [];
});

// Lyrics modal
const showLyrics = (lyrics, title) => {
  currentLyrics.value = lyrics;
  currentSongTitle.value = title;
  showLyricsDialog.value = true;
};

const truncateLyrics = (lyrics) => {
  if (!lyrics) return "";
  const words = lyrics.split(" ");
  return words.length > 5 ? words.slice(0, 5).join(" ") + "..." : lyrics;
};

// Copy lyrics
const copyLyrics = async () => {
  try {
    if (navigator.clipboard) {
      await navigator.clipboard.writeText(currentLyrics.value);
    }
    toastMessage.value = "Lyrics copied ✅";
    setTimeout(() => (toastMessage.value = ""), 3000);
    showLyricsDialog.value = false;
  } catch (err) {
    console.error("Failed to copy lyrics:", err);
  }
};

// Helpers
const getFullUrl = (path) => (path?.startsWith("http") ? path : `${baseUrl}${path}`);

const handleImageChange = (event) => {
  const file = event.target.files[0];
  if (!file) return;
  const reader = new FileReader();
  reader.onload = () => {
    user.value.profileImage = reader.result;
    const storedUser = JSON.parse(localStorage.getItem("user") || "{}");
    localStorage.setItem("user", JSON.stringify({ ...storedUser, profileImage: reader.result }));
  };
  reader.readAsDataURL(file);
};
</script>

<style scoped>
.audio-player::-webkit-media-controls-panel {
  background-color: #bfdbfe;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
