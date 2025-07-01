<template>
  <Header activeLink="home" />
  <div class="bg-gray-200 p-4 mx-auto min-h-screen">
    <div class="mx-auto max-w-screen-sm text-center mb-2 lg:mb-8">
      <h2
        class="mb-5 text-3xl tracking-tight font-extrabold text-gray-900 dark:text-white"
      >
        Our Music
      </h2>
      <p class="font-dark text-gray-700 lg:mb-4 sm:text-lg dark:text-gray-400">
        Download your audio and music sheets from this page.
      </p>
    </div>
    <div class="grid grid-cols-12 items-center gap-1">
      <div class="filters col-span-12 p-1 flex flex-row">
        <div class="flex items-start justify-between w-full">
          <div class="form-group flex flex-row items-center w-full max-w-xl">
            <label for="search" class="mr-2 whitespace-nowrap">Search</label>
            <input
              type="text"
              id="search"
              class="p-2 w-full text-sm border border-gray-500 rounded-lg"
              placeholder="Search by artist name, lyrics, composer name or song title..."
              v-model="filters.search"
              @input="debouncedFetchData"
            />
          </div>
        </div>
      </div>
      <!-- Lyrics Modal -->
      <div
        v-if="showLyricsDialog"
        class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center"
      >
        <div
          class="bg-white rounded-lg p-6 max-w-2xl w-full max-h-[80vh] flex flex-col"
        >
          <!-- Header -->
          <div class="flex justify-between items-center mb-4 flex-shrink-0">
            <h3 class="text-xl font-semibold">
              {{ currentSongTitle }} - Lyrics
            </h3>
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

          <!-- Scrollable Lyrics  -->
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
          </div>
        </div>
      </div>

      <!-- Songs table -->
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
              <tr v-if="createSongLoading">
                <td colspan="6" class="py-5 text-center">
                  Loading music records...
                </td>
              </tr>
              <tr v-else-if="songs.length === 0">
                <td colspan="6" class="py-5 text-center">
                  No music records found
                </td>
              </tr>
              <template v-else>
                <tr
                  v-for="(song, index) in songs"
                  :key="index"
                  class="border-b border-opacity-20 hover:bg-blue-100 transition-colors"
                >
                  <td class="px-2 py-4">{{ song.title }}</td>
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
                          class="inline-flex items-center px-4 py-2 text-white bg-blue-500 hover:bg-blue-700 rounded transition-colors"
                          download
                        >
                          Download PDF
                        </a>
                        <button
                          @click="showPdfPreview(song.pdf)"
                          class="inline-flex items-center px-4 py-2 text-white bg-green-500 hover:bg-green-700 rounded transition-colors"
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
                </tr>
              </template>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="col-span-12 mt-4 pb-5">
    <Pagination
      :currentPage="currentPage"
      :totalPages="totalPages"
      @page-changed="fetchData"
    />
  </div>
  <Footer />
</template>

<script setup>
import { ref, reactive, watch, watchEffect, onMounted } from "vue";
import { useQuery } from "@vue/apollo-composable";
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";
import Pagination from "@/components/pagination/Main.vue";
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";
import { debounce } from "lodash";

// Environment configuration
const baseUrl = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";

// Reactive state
const showLyricsDialog = ref(false);
const currentLyrics = ref("");
const currentSongTitle = ref("");
const songs = ref([]);
const currentPage = ref(1);
const totalPages = ref(1);
const filters = reactive({
  page: 1,
  first: 10,
  search: "",
});

// Apollo GraphQL Query
const {
  loading: createSongLoading,
  result: songsResult,
  onResult,
  onError,
  refetch,
} = useQuery(
  CREATE_SONG,
  () => ({
    songsSearch: { search: filters.search },
    page: currentPage.value,
    first: filters.first,
  }),
  { fetchPolicy: "network-only" }
);

const fetchData = (page = 1) => {
  currentPage.value = page;
  refetch({
    songsSearch: { search: filters.search },
    page: page,
    first: filters.first,
  });
};

const debouncedFetchData = debounce(() => {
  currentPage.value = 1;
  refetch({
    songsSearch: { search: filters.search },
    page: 1,
    first: filters.first,
  });
}, 300);

const getFullUrl = (path) => {
  if (!path) return "";
  return path.startsWith("http") ? path : `${baseUrl}${path}`;
};

const showPdfPreview = (path) => {
  const fullUrl = getFullUrl(path);
  if (fullUrl) window.open(fullUrl, "_blank");
};

// Handle query results
onResult((result) => {
  console.log("Paginator Info:", result.data?.songs?.paginatorInfo);

  if (result.data?.songs?.data) {
    songs.value = result.data.songs.data;
    totalPages.value = result.data.songs.paginatorInfo.lastPage || 1;
  } else {
    songs.value = [];
    totalPages.value = 1;
  }
});

onError((error) => {
  console.error("GraphQL Error:", error);
  songs.value = [];
});
watch(currentPage, (newPage) => {
  refetch({
    search: filters.search,
    page: newPage,
    first: filters.first,
  });
});
watch(
  () => filters.search,
  () => {
    currentPage.value = 1;
  }
);

/* Lyrics dialog box */

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
</script>

<style scoped>
table {
  border-collapse: separate;
  border-spacing: 0;
}

th,
td {
  padding: 12px 15px;
  background-color: rgba(219, 234, 254, 0.3);
}

th {
  background-color: #cbd5e1;
}

tr:hover td {
  background-color: rgba(191, 219, 254, 0.3);
}

.audio-player::-webkit-media-controls-panel {
  background-color: #bfdbfe;
}

.audio-player::-webkit-media-controls-play-button,
.audio-player::-webkit-media-controls-mute-button {
  filter: invert(1);
}
</style>
