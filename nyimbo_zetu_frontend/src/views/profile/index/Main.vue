<template>
  <Header />
  <div
    class="w-full max-w-auto mx-auto p-4 bg-gray-200 border border-gray-200 shadow-sm "
  >
    <!-- Profile Section -->
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

    <!-- Lyrics Modal -->
    <div
      v-if="showLyricsDialog"
      class="fixed inset-0 z-50 bg-gray-800/80 bg-opacity-10 flex items-center justify-center"
    >
      <div
        class="bg-white rounded-lg p-6 max-w-2xl w-full max-h-[80vh] flex flex-col"
      >
        <!-- Header -->
        <div class="flex justify-between items-center mb-4 flex-shrink-0">
          <h3 class="text-xl font-semibold">{{ currentSongTitle }} - Lyrics</h3>
          <button
            @click="showLyricsDialog = false"
            class="text-gray-500 hover:text-gray-700 cursor-pointer"
          >
            <svg
              class="w-6 h-6"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
        </div>

        <!-- Scrollable Lyrics (with hidden scrollbar) -->
        <div
          class="flex-1 overflow-y-auto [&::-webkit-scrollbar]:hidden [-ms-overflow-style:none] [scrollbar-width:none]"
        >
          <div class="whitespace-pre-wrap pb-2 pr-2">
            {{ currentLyrics }}
          </div>
        </div>

        <!-- Footer -->
        <div class="mt-4 flex justify-end flex-shrink-0">
          <button
            @click="showLyricsDialog = false"
            class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded-md transition-colors cursor-pointer"
          >
            Close
          </button>
          <button
            @click="copyLyrics()"
            class="px-4 py-2 ml-2 bg-blue-500 hover:bg-blue-600 text-white rounded-md transition-colors cursor-pointer"
          >
            Copy
          </button>
        </div>
      </div>
    </div>
    <!-- Songs Table -->
    <div class="flex justify-center pt-5 dark:text-gray-200">
      <h3 class="text-xl font-semibold mb-4">My Uploaded Songs</h3>
    </div>
    <div class="col-span-12 p-4 overflow-x-auto">
      <div class="w-full">
        <table class="w-full text-sm bg-blue-200 rounded-lg">
          <thead class="border-none font-semibold bg-slate-300">
            <tr>
              <th class="p-3 text-left">Song Title</th>
              <th class="p-3 text-left">Composer</th>
              <th class="p-3 text-left">Artist/Choir</th>
              <th class="p-3 text-left">Lyrics</th>
              <th class="p-3 text-left">Midi</th>
              <th class="p-3 text-left">Score Sheet</th>
              <th class="p-3 text-left">Youtube Link</th>
              <th class="p-3 text-left">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-if="createSongLoading">
              <td colspan="8" class="py-5 text-center">
                Loading music records...
              </td>
            </tr>
            <tr v-else-if="songs.length === 0">
              <td colspan="8" class="py-5 text-center">
                No music records found
              </td>
            </tr>
            <template v-else>
              <tr
                v-for="(song, index) in songs"
                :key="index"
                class="border-none hover:bg-blue-100 transition-colors"
              >
                <td class="px-2 pl-7 py-4">{{ song.title }}</td>
                <td class="px-2 py-4">{{ song.composer }}</td>
                <td class="px-2 py-4">{{ song.artists }}</td>
                <td
                  class="px-2 py-4 cursor-pointer lyrics-cell"
                  @click="showLyrics(song.lyrics, song.title)"
                >
                  {{ truncateLyrics(song.lyrics) }}
                </td>
                <td class="px-2 py-4">
                  <div class="flex items-center gap-2">
                    <audio controls class="w-48 p-2 audio-player">
                      <source :src="getFullUrl(song.midi)" />
                      Your browser does not support the audio element.
                    </audio>
                  </div>
                </td>
                <td class="px-2 py-4">
                  <div class="flex flex-col gap-2">
                    <div class="flex gap-2">
                      <a
                        :href="getFullUrl(song.pdf)"
                        class="inline-flex items-center px-4 py-2 text-white bg-blue-500 hover:bg-blue-700 rounded transition-colors cursor-pointer"
                        download
                      >
                        Download PDF
                      </a>
                      <button
                        @click="showPdfPreview(song.pdf)"
                        class="inline-flex items-center px-4 py-2 text-white bg-green-500 hover:bg-green-700 rounded transition-colors cursor-pointer"
                      >
                        Preview
                      </button>
                    </div>
                  </div>
                </td>
                <td class="px-2 py-4">
                  <a
                    v-if="song.ytlink"
                    :href="song.ytlink"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="text-blue-500 hover:underline"
                  >
                    Watch on YouTube
                  </a>
                  <span v-else class="text-gray-500">N/A</span>
                </td>
                <td class="px-2 py-4">
                  <div class="flex gap-5">
                    <button
                      @click="editSong(song)"
                      class="inline-flex items-center px-4 py-2 text-white bg-emerald-500 hover:bg-green-700 rounded transition-colors cursor-pointer"
                    >
                      Edit
                    </button>
                    <button
                      @click="deleteSong(song)"
                      class="inline-flex items-center px-4 py-2 text-white bg-red-700 hover:bg-red-500 rounded transition-colors cursor-pointer"
                    >
                      Delete
                    </button>
                  </div>
                </td>
              </tr>
            </template>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Upload song button -->
    <div class="flex justify-end p-5">
      <button
        @click="handleUploadForm"
        class="flex items-center gap-2 text-xs md:text-lg px-2 py-2 mb-5 text-white bg-blue-500 rounded-md hover:bg-blue-600 transition-colors cursor-pointer"
      >
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
          <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
        </svg>
        Upload Song
      </button>
    </div>

    <!-- Route modal outlet -->
    <router-view v-slot="{ Component }">
      <component
        :is="Component"
        class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center mt-20"
      />
    </router-view>
  </div>
  <Footer />
</template>

<script setup>
import { ref, onMounted, computed, nextTick, watch } from "vue";
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";
import { useQuery } from "@vue/apollo-composable";
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";
import { useRouter } from "vue-router";

// Environment configuration
const baseUrl = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";

const router = useRouter();

// Refs
const showLyricsDialog = ref(false);
const currentLyrics = ref("");
const currentSongTitle = ref("");
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
const createSongLoading = ref(false);

// Computed
const userId = computed(() => user.value.id);

// GraphQL Query

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

// Methods
const handleUploadForm = () => {
  router.push({ name: "upload" });
};

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

const getFullUrl = (path) => {
  if (!path) return "";
  return path.startsWith("http") ? path : `${baseUrl}${path}`;
};

const showPdfPreview = (path) => {
  const fullUrl = getFullUrl(path);
  if (fullUrl) window.open(fullUrl, "_blank");
};

const handleImageChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      user.value.profileImage = reader.result;
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


  // Lifecycle Hooks
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
});

onUserSongsResult((result) => {
  songs.value = result?.data?.songs?.data || [];
  songTotalPages.value = result?.data?.songs?.paginatorInfo?.lastPage || 1;

});

/* copy lyrics */
const copyLyrics = async () => {
  try {
    // Modern clipboard API approach
    if (navigator.clipboard) {
      await navigator.clipboard.writeText(currentLyrics.value);
      alert("Lyrics copied to clipboard!");
      return;
    }

    // Fallback for older browsers
    const textarea = document.createElement("textarea");
    textarea.value = currentLyrics.value;
    textarea.style.position = "fixed";
    textarea.style.opacity = "0";
    document.body.appendChild(textarea);
    textarea.select();

    try {
      const successful = document.execCommand("copy");
      if (!successful) {
        throw new Error("Copy command failed");
      }
      alert("Lyrics copied to clipboard!");
    } finally {
      document.body.removeChild(textarea);
    }
  } catch (err) {
    console.error("Failed to copy lyrics:", err);
    alert("Failed to copy lyrics");
  }
};
</script>
