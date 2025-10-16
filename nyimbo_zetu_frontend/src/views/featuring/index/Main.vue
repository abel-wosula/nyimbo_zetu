<template>
  <Header />
  <div class="pb-10 bg-gray-200">
    <!-- Artists Section -->
    <div class="p-5">
      <h1 class="text-2xl font-semibold p-3 text-center font-serif">Artists</h1>
      <div class="relative">
        <div class="flex overflow-x-auto pb-4 hide-scrollbar space-x-4 pl-4">
          <!-- Artist Cards -->
          <div
            v-for="artist in artists"
            :key="artist.name"
            class="flex-shrink-0 w-64 bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 h-full flex flex-col"
          >
            <div class="p-4 flex flex-col items-center">
              <img
                :src="artist.image"
                :alt="artist.name"
                class="w-20 h-20 rounded-full object-cover border-4 border-gray-100 shadow-sm"
              />
              <h2 class="mt-3 text-xl font-bold text-gray-800">
                {{ artist.name }}
              </h2>
              <p class="mt-2 text-gray-600 text-sm text-center flex-grow">
                {{ artist.description }}
              </p>
              <span class="mt-2 text-xs text-blue-500">{{ artist.genre }}</span>
              <a
                :href="artist.youtube"
                target="_blank"
                class="mt-2 text-xs text-red-600 hover:underline"
              >
                YouTube Channel
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Choirs Section -->
    <div class="p-5">
      <h1 class="text-2xl font-semibold p-3 text-center font-serif">Choirs</h1>
      <div class="relative">
        <div class="flex overflow-x-auto pb-4 hide-scrollbar space-x-4 pl-4">
          <!-- Choir Cards -->
          <div
            v-for="choir in choirs"
            :key="choir.name"
            class="flex-shrink-0 w-64 bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 h-full flex flex-col"
          >
            <div class="p-4 flex flex-col items-center">
              <img
                :src="choir.image"
                :alt="choir.name"
                class="w-20 h-20 rounded-full object-cover border-4 border-gray-100 shadow-sm"
              />
              <h2 class="mt-3 text-xl font-bold text-gray-800">
                {{ choir.name }}
              </h2>
              <p class="mt-2 text-gray-600 text-sm text-center flex-grow">
                {{ choir.description }}
              </p>
              <span class="mt-2 text-xs text-blue-500"
                >Founded: {{ choir.founded }}</span
              >
              <a
                :href="choir.youtube"
                target="_blank"
                class="mt-2 text-xs text-red-600 hover:underline"
              >
                YouTube Channel
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Composers Section -->
    <div class="p-5">
      <h1 class="text-2xl font-semibold p-3 text-center font-serif">
        Composers
      </h1>
      <div class="relative">
        <div class="flex overflow-x-auto pb-4 hide-scrollbar space-x-4 pl-4">
          <!-- Composer Cards -->
          <div
            v-for="composer in composers"
            :key="composer.name"
            class="flex-shrink-0 w-64 bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 h-full flex flex-col"
          >
            <div class="p-4 flex flex-col items-center">
              <img
                :src="composer.image"
                :alt="composer.name"
                class="w-20 h-20 rounded-full object-cover border-4 border-gray-100 shadow-sm"
              />
              <h2 class="mt-3 text-xl font-bold text-gray-800">
                {{ composer.name }}
              </h2>
              <p class="mt-2 text-gray-600 text-sm text-center flex-grow">
                {{ composer.description }}
              </p>
              <span class="mt-2 text-xs text-blue-500">{{
                composer.specialty
              }}</span>
              <a
                :href="composer.youtube"
                target="_blank"
                class="mt-2 text-xs text-red-600 hover:underline"
              >
                YouTube Channel
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Studios Section -->
    <div class="p-5">
      <h1 class="text-2xl font-semibold p-3 text-center font-serif">Studios</h1>
      <div class="relative">
        <div class="flex overflow-x-auto pb-4 hide-scrollbar space-x-4 pl-4">
          <!-- Studio Cards -->
          <div
            v-for="studio in studios"
            :key="studio.name"
            class="flex-shrink-0 w-64 bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300 h-full flex flex-col"
          >
            <div class="p-4 flex flex-col items-center">
              <img
                :src="studio.image"
                :alt="studio.name"
                class="w-20 h-20 rounded-full object-cover border-4 border-gray-100 shadow-sm"
              />
              <h2 class="mt-3 text-xl font-bold text-gray-800">
                {{ studio.name }}
              </h2>
              <p class="mt-2 text-gray-600 text-sm text-center flex-grow">
                {{ studio.description }}
              </p>
              <span class="mt-2 text-xs text-blue-500">{{
                studio.location
              }}</span>
              <a
                :href="studio.youtube"
                target="_blank"
                class="mt-2 text-xs text-red-600 hover:underline"
              >
                YouTube Channel
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <Footer />
</template>

<script setup>
import Header from "@/components/header/index/Main.vue";
import Footer from "@/components/footer/index/Main.vue";

// Kenyan Artists Data
const artists = [
  {
    name: "Zack Amala",
    image: "",
    description:
      "Renowned Kenyan gospel artist known for his powerful worship songs and ministry.",
    genre: "Gospel",
    youtube: "://www.youtuhttpsbe.com/@Sultanfix24",
  },
  {
    name: "Joan Wambura",
    image: "",
    description:
      "Gospel minister with a unique blend of contemporary and traditional worship styles.",
    genre: "Gospel",
    youtube: "https://www.youtube.com/@joanwambura",
  },
  {
    name: "Dennis Wambua",
    image: "",
    description:
      "Catholic solo artist known for his inspirational hymns and liturgical music.",
    genre: "Catholic Solo",
    youtube: "https://www.youtube.com/@denniswambua",
  },
  {
    name: "Monica Mbithe",
    image: "",
    description:
      "Award-winning gospel artist with powerful vocals and inspirational messages.",
    genre: "Gospel",
    youtube: "https://www.youtube.com/@MonicaMbitheMusic",
  },
  {
    name: "Abigael Mumbua",
    image: "",
    description:
      "Gospel artist blending traditional African sounds with contemporary worship.",
    genre: "Gospel",
    youtube: "https://www.youtube.com/@abigaelmumbua432",
  },
  {
    name: "Lawrence Kameja",
    image: "",
    description:
      "Gospel minister known for his uplifting worship songs and choir direction.",
    genre: "Gospel",
    youtube: "https://www.youtube.com/@MelodicHarmonyChorale",
  },
];

// Kenyan Choirs Data
const choirs = [
  {
    name: "Kwaya Ya Mtakatifu Romano Mtunzi",
    image: "",
    description:
      "Renowned Catholic choir known for liturgical music and Swahili hymns.",
    founded: "1985",
    youtube: "https://www.youtube.com/@kmrmcatcomjkuat",
  },
  {
    name: "La Cuatro Voces",
    image: "",
    description:
      "Award-winning acapella group blending gospel with African harmonies.",
    founded: "2005",
    youtube: "https://www.youtube.com/@LacuatroVoces",
  },
  {
    name: "SPYC - Thika",
    image: "",
    description:
      "St. Paul's Youth Group choir known for energetic gospel performances.",
    founded: "1990",
    youtube: "https://www.youtube.com/@st.patricksyouthchoi",
  },
  {
    name: "KUCCC",
    image: "",
    description:
      "Kenya University Catholic Chaplaincy Choir with contemporary worship style.",
    founded: "1972",
    youtube: "https://www.youtube.com/@KUCC_CHOIR",
  },
  {
    name: "DOKC",
    image: "",
    description:
      "Don Orione Catholic Choir known for liturgical music and Swahili hymns.",
    founded: "1980",
    youtube: "https://www.youtube.com/@dokctv_dokccatholic",
  },
];

// Kenyan Composers Data
const composers = [
  {
    name: "Albert Nyabera",
    image: "",
    description:
      "Legendary composer of Catholic hymns blending African and Western styles.",
    specialty: "Choral Music",
    youtube: "https://www.youtube.com/@albertnyabera",
  },
  {
    name: "Abel Wafula",
    image: "",
    description:
      "Contemporary gospel composer known for innovative arrangements.",
    specialty: "Gospel Arrangements",
    youtube: "https://www.youtube.com/@AbelWafula",
  },
  {
    name: "Julius Anari",
    image: "",
    description:
      "Renowned worship leader and composer of popular Swahili hymns.",
    specialty: "Worship Music",
    youtube: "https://www.youtube.com/@JuliusAnari",
  },
  {
    name: "Antony Nyongesa",
    image: "",
    description:
      "Composer specializing in liturgical music for Catholic worship.",
    specialty: "Liturgical Music",
    youtube: "https://www.youtube.com/@AntonyNyongesa",
  },
  {
    name: "Joan Wambura",
    image: "",
    description:
      "Contemporary gospel composer blending traditional and modern styles.",
    specialty: "Fusion Gospel",
    youtube: "https://www.youtube.com/@joanwambura",
  },
];

// Kenyan Studios Data
const studios = [
  {
    name: "KMRM Studios",
    image: "",
    description:
      "Premier recording studio specializing in gospel and liturgical music production.",
    location: "Nairobi",
    youtube: "https://www.youtube.com/@kmrmcatcomjkuat",
  },
  {
    name: "DOKC Studios",
    image: "",
    description:
      "State-of-the-art recording facility for choral and worship music.",
    location: "Karen, Nairobi",
    youtube: "https://www.youtube.com/@DOKCStudios",
  },
  {
    name: "Neema Pro Studios",
    image: "",
    description:
      "Professional studio known for high-quality gospel music production.",
    location: "Westlands, Nairobi",
    youtube: "https://www.youtube.com/@NeemaProStudios",
  },
  {
    name: "Golden Choice Studios",
    image: "",
    description:
      "Modern recording facility serving both established and upcoming gospel artists.",
    location: "Kilimani, Nairobi",
    youtube: "https://www.youtube.com/@GoldenChoiceStudios",
  },
  {
    name: "Khaks Studio",
    image: "",
    description:
      "Affordable recording studio helping nurture young talent in gospel music.",
    location: "Eastleigh, Nairobi",
    youtube: "https://www.youtube.com/@KhaksStudio",
  },
];
</script>

<style>
.hide-scrollbar::-webkit-scrollbar {
  display: none;
}

.hide-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>
