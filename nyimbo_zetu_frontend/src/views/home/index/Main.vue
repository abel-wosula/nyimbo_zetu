<template>
  <Header activeLink="home" />
  <div class="max-w-1/2 bg-white p-4 mx-auto min-h-screen">
    <div class="mx-auto max-w-screen-sm text-center mb-2 lg:mb-8">
      <h2
        class="mb-4 text-4xl tracking-tight font-extrabold text-gray-900 dark:text-white"
      >
        Our Music
      </h2>
      <p class="font-light text-gray-700 lg:mb-4 sm:text-xl dark:text-gray-400">
        Download your audio and music sheets from this page.
      </p>
    </div>
    <div class="grid grid-cols-12 items-center gap-2">
      <div class="filters col-span-1 p-1 flex flex-row">
        <div class="flex items-start justify-between w-full">
          <div class="form-group flex flex-row items-center">
            <label for="search" class="mr-2">Search</label>
            <input
              type="text"
              id="search"
              class="w-full p-1 border border-gray-400 rounded-lg"
              placeholder="Search music..."
            />
          </div>
        </div>
      </div>
      <div class=" ">
        <div class="">
          <table class="text-sm bg-blue-200 rounded-lg">
            <thead class="border-b border-gray-600 font-semibold bg-slate-300">
              <tr>
                <th class="p-3 text-left">Music Title</th>
                <th class="p-3 text-left">Lyrics</th>
                <th class="p-3 text-left">Composer</th>
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
                  <td class="px-2 py-4 font-medium">{{ song.title }}</td>
                  <td class="px-2 py-4">
                    <div class="flex items-center gap-2">
                      <span class="text-sm">{{ getFileName(song.midi) }}</span>
                      <audio controls class="w-48 audio-player">
                        <source
                          :src="getFullUrl(song.midi)"
                          type="audio/midi"
                        />
                        Your browser does not support the audio element.
                      </audio>
                    </div>
                  </td>
                  <td class="px-2 py-4">{{ song.composer || "N/A" }}</td>
                  <td class="px-2 py-4">
                    <div class="flex flex-col gap-2">
                      <span class="text-sm">{{ getFileName(song.pdf) }}</span>
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
</template>

<script setup>
import { ref, reactive, watch, onMounted } from "vue";
import { useQuery } from "@vue/apollo-composable";
import Header from "@/components/header/index/Main.vue";
/* import Pagination from "@/components/pagination/Main.vue"; */
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";

// Environment configuration
const baseUrl = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";

// Reactive state
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
    page: currentPage.value,
    first: filters.first,
    search: filters.search,
  }),
  { fetchPolicy: "network-only" }
);

// Watchers
watch(currentPage, (newPage) => {
  refetch({ page: newPage, first: filters.first });
});

const debouncedFetchData = debounce(() => {
  refetch({ search: filters.search });
}, 300);

// Helper functions
const getFileName = (path) => {
  return path?.split("/").pop() || "pdf";
};

const getFullUrl = (path) => {
  if (!path) return "";
  return path.startsWith("http") ? path : `${baseUrl}${path}`;
};

const showPdfPreview = (path) => {
  const fullUrl = getFullUrl(path);
  if (fullUrl) window.open(fullUrl, "_blank");
};

// Debounce utility
function debounce(fn, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => fn.apply(this, args), delay);
  };
}

// Handle query results
onResult((result) => {
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
