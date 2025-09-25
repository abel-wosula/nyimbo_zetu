<template>
  <div
    class="fixed inset-0 z-50 flex items-center justify-center p-3 bg-gray-800/80 bg-opacity-50 overflow-hidden"
    @click="handleBackdropClick"
  >
    <div
      ref="modalContent"
      class="max-w-3xl w-full max-h-[90vh] p-6 sm:p-8 relative bg-gray-200 dark:bg-gray-800 rounded-lg shadow-xl overflow-y-auto [scrollbar-width:none] [-ms-overflow-style:none]"
    >
      <div class="[&::-webkit-scrollbar]:hidden">
        <button
          @click="closeModal"
          class="absolute top-4 right-4 text-gray-500 hover:text-black dark:hover:text-white md:text-2xl text-xl cursor-pointer"
        >
          ✖
        </button>
        <h1
          class="md:text-3xl text-xl font-bold text-center mb-8 text-indigo-600 dark:text-indigo-200"
        >
          Upload a New Song
        </h1>

        <form @submit.prevent="handleSubmit" class="space-y-6">
          <!-- Song Title -->
          <div>
            <label
              for="title"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Song Title *</label
            >
            <input
              v-model="form.title"
              type="text"
              id="title"
              required
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 p-3 border dark:bg-gray-700 dark:border-gray-600 dark:text-white"
            />
          </div>

          <!-- Artist -->
          <div>
            <label
              for="artist"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Artist/Choir</label
            >
            <input
              v-model="form.artist"
              type="text"
              id="artist"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 p-3 border dark:bg-gray-700 dark:border-gray-600 dark:text-white"
            />
          </div>

          <!-- Composer -->
          <div>
            <label
              for="composer"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Composer</label
            >
            <input
              v-model="form.composer"
              type="text"
              id="composer"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 p-3 border dark:bg-gray-700 dark:border-gray-600 dark:text-white"
            />
          </div>

          <!-- Category & Subcategory Dropdowns -->
          <div class="space-y-6">
            <!-- Category Dropdown -->
            <div class="relative w-full category-dropdown">
              <label
                class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1"
                >Category *</label
              >
              <button
                type="button"
                @click="toggleCategoryDropdown"
                class="border p-3 rounded-md w-full cursor-pointer bg-white dark:bg-gray-700 text-gray-800 dark:text-white shadow-sm flex justify-between items-center focus:outline-none"
              >
                <span>{{ selectedCategory || "Select a category" }}</span>
                <svg
                  class="w-4 h-4 ml-2 text-gray-500 dark:text-gray-200"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M19 9l-7 7-7-7"
                  />
                </svg>
              </button>

              <!-- Category Options -->
              <div
                v-if="showCategoryDropdown"
                class="absolute z-50 mt-2 w-full bg-white dark:text-gray-100 dark:bg-gray-700 border rounded-md shadow-lg max-h-60 overflow-y-auto scrollbar-none"
              >
                <ul>
                  <li
                    v-for="(subs, cat) in categories"
                    :key="cat"
                    @click="selectCategory(cat)"
                    class="px-4 py-2 hover:bg-indigo-100 dark:hover:bg-indigo-600 cursor-pointer"
                  >
                    {{ cat }}
                  </li>
                </ul>
              </div>
            </div>

            <!-- Subcategory Dropdown -->
            <div
              v-if="selectedCategory"
              class="relative w-full subcategory-dropdown"
            >
              <label
                class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1"
                >Subcategory *</label
              >
              <button
                type="button"
                @click="toggleSubcategoryDropdown"
                class="border p-3 rounded-md w-full cursor-pointer bg-white dark:bg-gray-700 text-gray-800 dark:text-white shadow-sm flex justify-between items-center focus:outline-none"
              >
                <span>{{ selectedSubcategory || "Select a subcategory" }}</span>
                <svg
                  class="w-4 h-4 ml-2 text-gray-500 dark:text-gray-400"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M19 9l-7 7-7-7"
                  />
                </svg>
              </button>

              <!-- Subcategory Options -->
              <div
                v-if="showSubcategoryDropdown"
                class="absolute z-50 mt-2 w-full bg-white dark:bg-gray-700 border rounded-md shadow-lg max-h-60 overflow-y-auto scrollbar-none"
              >
                <ul>
                  <li
                    v-for="sub in categories[selectedCategory]"
                    :key="sub.id"
                    @click="selectSubcategory(sub)"
                    class="px-4 py-2 hover:bg-indigo-100 dark:text-gray-100 dark:hover:bg-indigo-600 cursor-pointer"
                  >
                    {{ sub.name }}
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <!-- YouTube Link -->
          <div>
            <label
              for="youtube"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >YouTube Link</label
            >
            <input
              v-model="form.ytlink"
              type="url"
              id="youtube"
              placeholder="https://www.youtube.com/watch?v=..."
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 p-3 border dark:bg-gray-700 dark:border-gray-600 dark:text-white"
            />
          </div>

          <!-- PDF Upload -->
          <div>
            <label
              for="pdf"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Sheet Music (PDF)</label
            >
            <input
              @change="handlePdfUpload"
              type="file"
              id="pdf"
              accept=".pdf"
              class="mt-1 block w-full text-sm text-gray-500 dark:text-gray-400 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 dark:file:bg-indigo-900 dark:file:text-indigo-200 dark:hover:file:bg-indigo-800"
            />
          </div>

          <!-- Audio/MIDI Upload -->
          <div>
            <label
              for="midi"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Audio/MIDI File</label
            >
            <input
              @change="handleAudioUpload"
              type="file"
              id="midi"
              accept=".mp3,.wav,.mid,.midi"
              class="mt-1 block w-full text-sm text-gray-500 dark:text-gray-400 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 dark:file:bg-indigo-900 dark:file:text-indigo-200 dark:hover:file:bg-indigo-800"
            />
          </div>

          <!-- Lyrics -->
          <div>
            <label
              for="lyrics"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
              >Lyrics</label
            >
            <textarea
              v-model="form.lyrics"
              id="lyrics"
              rows="6"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 p-3 border dark:bg-gray-700 dark:border-gray-600 dark:text-white"
            ></textarea>
          </div>

          <!-- Submit Button -->
          <div class="flex justify-end">
            <button
              type="submit"
              class="px-6 py-3 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:bg-indigo-700 dark:hover:bg-indigo-800 transition-colors"
              :disabled="isSubmitting || !formValid"
            >
              {{ isSubmitting ? "Uploading..." : "Upload Song" }}
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Toast Notifications -->
    <div class="fixed top-4 right-4 z-[9999] space-y-2">
      <div
        v-for="(toast, index) in toasts"
        :key="index"
        :class="[
          'px-4 py-2 rounded shadow-md text-white animate-fade-in',
          toast.type === 'success' ? 'bg-green-600' : 'bg-red-600',
        ]"
      >
        {{ toast.message }}
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from "vue";
import { UPLOAD_SONG } from "@/graphql/Mutations/createSong";
import { CREATE_SUBCATEGORY } from "@/graphql/Queries/createSubCategory.graphql";
import { useMutation, useQuery } from "@vue/apollo-composable";
import { useRouter } from "vue-router";

const router = useRouter();
const closeModal = () => router.back();
const modalContent = ref(null);

// Toast state
const toasts = ref([]);
const showToast = (message, type = "success") => {
  const id = Date.now();
  toasts.value.push({ id, message, type });
  setTimeout(() => {
    toasts.value = toasts.value.filter((t) => t.id !== id);
  }, 3000);
};

// Handle clicking outside modal
const handleBackdropClick = (event) => {
  if (event.target === event.currentTarget) {
    closeModal();
  }
};

// Fetch subcategories
const { result: subcategoriesResult } = useQuery(CREATE_SUBCATEGORY);

const categories = computed(() => {
  const map = {};
  const subs = subcategoriesResult.value?.subcategory?.data || [];
  subs.forEach((sub) => {
    const catLabel = sub.category?.name;
    if (!catLabel) return;
    if (!map[catLabel]) map[catLabel] = [];
    map[catLabel].push({ ...sub, id: sub.id || sub.category_id });
  });
  return map;
});

// Form state
const form = ref({
  title: "",
  artist: "",
  composer: "",
  subcategory_id: "",
  ytlink: "",
  pdf: null,
  midi: null,
  lyrics: "",
});
const isSubmitting = ref(false);
const formValid = computed(
  () => !!form.value.title && !!form.value.subcategory_id
);

// Mutation
const { mutate: createSong } = useMutation(UPLOAD_SONG);

const handlePdfUpload = (e) => (form.value.pdf = e.target.files[0]);
const handleAudioUpload = (e) => (form.value.midi = e.target.files[0]);

const resetForm = () => {
  form.value = {
    title: "",
    artist: "",
    composer: "",
    subcategory_id: "",
    ytlink: "",
    pdf: null,
    midi: null,
    lyrics: "",
  };
  selectedCategory.value = "";
  selectedSubcategory.value = "";
  document.getElementById("pdf").value = "";
  document.getElementById("midi").value = "";
};

const handleSubmit = async () => {
  if (!formValid.value) {
    showToast("Please fill required fields", "error");
    return;
  }
  isSubmitting.value = true;
  try {
    const input = {
      title: form.value.title,
      artists: form.value.artist,
      composer: form.value.composer,
      ytlink: form.value.ytlink,
      lyrics: form.value.lyrics,
      subcategory_id: form.value.subcategory_id,
      pdf: form.value.pdf,
      midi: form.value.midi,
      user_id: 1,
    };
    await createSong({ input }, { context: { hasUpload: true } });
    showToast("Song uploaded successfully!", "success");
    resetForm();
    closeModal();
  } catch (error) {
    console.error("Upload failed:", error);
    showToast(`Upload failed: ${error.message}`, "error");
  } finally {
    isSubmitting.value = false;
  }
};

// Category/Subcategory dropdown
const selectedCategory = ref("");
const selectedSubcategory = ref("");
const showCategoryDropdown = ref(false);
const showSubcategoryDropdown = ref(false);

const toggleCategoryDropdown = () => {
  showCategoryDropdown.value = !showCategoryDropdown.value;
  if (showCategoryDropdown.value) showSubcategoryDropdown.value = false;
};
const toggleSubcategoryDropdown = () => {
  if (!selectedCategory.value) return;
  showSubcategoryDropdown.value = !showSubcategoryDropdown.value;
  if (showSubcategoryDropdown.value) showCategoryDropdown.value = false;
};
const selectCategory = (cat) => {
  selectedCategory.value = cat;
  selectedSubcategory.value = "";
  form.value.subcategory_id = "";
  showCategoryDropdown.value = false;
};
const selectSubcategory = (sub) => {
  const subId = sub.id || sub.category_id;
  if (!subId) return;
  selectedSubcategory.value = sub.name;
  form.value.subcategory_id = subId;
  showSubcategoryDropdown.value = false;
};

// Escape key
const handleKeydown = (event) => {
  if (event.key === "Escape") closeModal();
};
onMounted(() => document.addEventListener("keydown", handleKeydown));
onUnmounted(() => document.removeEventListener("keydown", handleKeydown));
</script>

<style scoped>
@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.animate-fade-in {
  animation: fade-in 0.3s ease-out;
}
</style>
