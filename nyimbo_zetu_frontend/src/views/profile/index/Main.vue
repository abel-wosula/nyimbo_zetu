<template>
  <Header />

  <div class="w-full max-w-auto mx-auto p-4 bg-gray-200 border border-gray-200 shadow-sm">
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

      <h5 class="mb-1 text-xl font-medium text-gray-900">
        {{ user.first_name }} {{ user.last_name }}
      </h5>
      <span class="text-sm text-gray-500">{{ user.email }}</span>
    </div>

    <!-- Lyrics Modal -->
    <div
      v-if="showLyricsDialog"
      class="fixed inset-0 z-50 bg-gray-800/80 flex items-center justify-center"
    >
      <div class="bg-white rounded-lg p-6 max-w-2xl w-full max-h-[80vh] flex flex-col">
        <!-- Header -->
        <div class="flex justify-between items-center mb-4">
          <h3 class="text-xl font-semibold">{{ currentSongTitle }} - Lyrics</h3>
          <button @click="showLyricsDialog = false" class="text-gray-500 hover:text-gray-700">
            ✕
          </button>
        </div>

        <!-- Lyrics Content -->
        <div class="flex-1 overflow-y-auto whitespace-pre-wrap pr-2">
          {{ currentLyrics }}
        </div>

        <!-- Footer -->
        <div class="mt-4 flex justify-end">
          <button
            @click="showLyricsDialog = false"
            class="px-4 py-2 bg-gray-200 hover:bg-gray-300 rounded-md"
          >
            Close
          </button>
          <button
            @click="copyLyrics"
            class="px-4 py-2 ml-2 bg-blue-500 hover:bg-blue-600 text-white rounded-md"
          >
            Copy
          </button>
        </div>
      </div>
    </div>

    <!-- Songs Table -->
    <div class="flex justify-center pt-5">
      <h3 class="text-xl font-semibold mb-4">My Uploaded Songs</h3>
    </div>

    <div class="col-span-12 p-4 overflow-x-auto">
      <table class="w-full text-sm bg-blue-200 rounded-lg">
        <thead class="bg-slate-300 font-semibold">
          <tr>
            <th class="p-3 text-left">Song Title</th>
            <th class="p-3 text-left">Composer</th>
            <th class="p-3 text-left">Artist/Choir</th>
            <th class="p-3 text-left">Lyrics</th>
            <th class="p-3 text-left">Midi</th>
            <th class="p-3 text-left">Score Sheet</th>
            <th class="p-3 text-left">YouTube Link</th>
            <th class="p-3 text-left">Action</th>
          </tr>
        </thead>

        <tbody>
          <!-- Loading State -->
          <tr v-if="loadingSongs">
            <td colspan="8" class="py-5 text-center">Loading music records...</td>
          </tr>

          <!-- Empty State -->
          <tr v-else-if="songs.length === 0">
            <td colspan="8" class="py-5 text-center">No music records found!</td>
          </tr>

          <!-- Songs -->
          <tr
            v-for="song in songs"
            :key="song.id"
            class="hover:bg-blue-100 transition-colors"
          >
            <td class="px-2 pl-7 py-4">{{ song.title }}</td>
            <td class="px-2 py-4">{{ song.composer }}</td>
            <td class="px-2 py-4">{{ song.artists }}</td>

            <td
              class="px-2 py-4 cursor-pointer"
              @click="showLyrics(song.lyrics, song.title)"
            >
              {{ truncateLyrics(song.lyrics) }}
            </td>

            <td class="px-2 py-4">
              <audio controls class="w-48 p-2 audio-player">
                <source :src="getFullUrl(song.midi)" />
              </audio>
            </td>

            <td class="px-2 py-4">
              <div class="flex gap-2">
                <a
                  :href="getFullUrl(song.pdf)"
                  download
                  class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700"
                >
                  Download PDF
                </a>

                <button
                  @click="showPdfPreview(song.pdf)"
                  class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-700"
                >
                  Preview
                </button>
              </div>
            </td>

            <td class="px-2 py-4">
              <a
                v-if="song.ytlink"
                :href="song.ytlink"
                target="_blank"
                class="text-blue-500 hover:underline"
              >
                Watch
              </a>
              <span v-else class="text-gray-500">N/A</span>
            </td>

            <td class="px-2 py-4">
              <div class="flex gap-4">
                <button
                  @click="editSong(song)"
                  class="px-4 py-2 bg-emerald-500 text-white rounded hover:bg-emerald-600"
                >
                  Edit
                </button>

                <button
                  @click="deleteSong(song)"
                  class="px-4 py-2 bg-red-700 text-white rounded hover:bg-red-500"
                >
                  Delete
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Upload Button -->
    <div class="flex justify-end p-5">
      <button
        @click="handleUploadForm"
        class="flex items-center gap-2 px-2 py-2 mb-5 bg-blue-500 text-white rounded-md hover:bg-blue-600"
      >
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
          <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z" />
        </svg>
        Upload Song
      </button>
    </div>

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
import { ref, computed, onMounted, watch } from "vue";
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";
import { useQuery } from "@vue/apollo-composable";
import { CREATE_SONG } from "@/graphql/Queries/createSong.graphql";
import { useRouter } from "vue-router";

const router = useRouter();
const baseUrl = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";

/* ---------------------- USER STATE ---------------------- */
const user = ref({
  id: "",
  email: "",
  first_name: "",
  last_name: "",
  profileImage: "",
});

onMounted(() => {
  const stored = localStorage.getItem("user");
  if (stored) {
    const parsed = JSON.parse(stored);
    user.value = {
      ...parsed,
      profileImage:
        parsed.profileImage ||
        "https://flowbite.com/docs/images/people/profile-picture-5.jpg",
    };
  }
});

/* ---------------------- SONGS QUERY ---------------------- */
const songs = ref([]);
const loadingSongs = ref(false);

const { result, refetch } = useQuery(
  CREATE_SONG,
  () => ({
    songsSearch: { search: "" },
    page: 1,
    first: 10,
    user_id: user.value.id,
  }),
  {
    enabled: false, // Only fetch when user is ready
    fetchPolicy: "network-only",
  }
);

watch(
  () => user.value.id,
  async (id) => {
    if (id) {
      loadingSongs.value = true;
      await refetch();
      loadingSongs.value = false;
    }
  }
);

watch(result, (res) => {
  songs.value = res?.data?.songs?.data || [];
});

/* ---------------------- METHODS ---------------------- */
const handleUploadForm = () => router.push({ name: "upload" });

const showLyricsDialog = ref(false);
const currentLyrics = ref("");
const currentSongTitle = ref("");

const showLyrics = (lyrics, title) => {
  currentSongTitle.value = title;
  currentLyrics.value = lyrics;
  showLyricsDialog.value = true;
};

const truncateLyrics = (text) => {
  if (!text) return "";
  const words = text.split(" ");
  return words.length > 5 ? words.slice(0, 5).join(" ") + "..." : text;
};

const getFullUrl = (p) =>
  p?.startsWith("http") ? p : p ? `${baseUrl}${p}` : "";

const showPdfPreview = (path) => {
  const fullUrl = getFullUrl(path);
  if (fullUrl) window.open(fullUrl, "_blank");
};

const handleImageChange = (e) => {
  const file = e.target.files[0];
  if (!file) return;

  const reader = new FileReader();
  reader.onload = () => {
    user.value.profileImage = reader.result;

    const saved = JSON.parse(localStorage.getItem("user"));
    localStorage.setItem(
      "user",
      JSON.stringify({
        ...saved,
        profileImage: reader.result,
      })
    );
  };
  reader.readAsDataURL(file);
};

const copyLyrics = async () => {
  try {
    await navigator.clipboard.writeText(currentLyrics.value);
    alert("Lyrics copied!");
  } catch {
    alert("Failed to copy lyrics");
  }
};
</script>
