<script setup>
import { ref, computed } from 'vue'
import { Link, Head } from '@inertiajs/vue3'
import { Icon } from '@iconify/vue'

// --- STATE & FILTERS ---
const currentCity = ref('Bengaluru')
const cities = ['Bengaluru', 'Hyderabad', 'Chennai', 'Pune', 'Mumbai']

const showFilterDrawer = ref(false)
const selectedCategory = ref('all')

const filters = ref({
  searchQuery: '',
  approvalType: 'all',
  facing: 'all',
  plotDimension: 'all',
  minPrice: '',
  maxPrice: '',
  verifiedOnly: false,
  directOwnerOnly: false
})

// Horizontal Filter Capsules
const quickFilters = [
  { id: 'all', label: 'All Plots', icon: 'lucide:layers' },
  { id: 'gated', label: 'Gated Communities', icon: 'lucide:shield-check' },
  { id: 'biappa', label: 'BIAPPA / BDA', icon: 'lucide:award' },
  { id: 'east', label: 'East Facing Vastu', icon: 'lucide:compass' },
  { id: 'corner', label: 'Corner Plots', icon: 'lucide:box' },
  { id: 'commercial', label: 'Commercial Land', icon: 'lucide:building-2' },
  { id: 'agri', label: 'Managed Farmland', icon: 'lucide:sprout' }
]

// --- PLOTS DATA (With Multiple Images for Carousels) ---
const plotListings = ref([
  {
    id: 101,
    title: 'Prestige Marigold Phase 2 Plots',
    locality: 'Bettenahalli, Devanahalli',
    city: 'Bengaluru',
    price: '₹72.5 L',
    pricePerSqFt: '₹4,833/sq.ft',
    dimensions: '30x50 ft (1,500 sq.ft)',
    facing: 'East Facing',
    tag: 'RERA & BIAPPA',
    category: 'gated',
    verified: true,
    isSaved: false,
    activeImageIndex: 0,
    images: [
      'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=800&q=80'
    ]
  },
  {
    id: 102,
    title: '40x60 Villa Plot in Imperial Gardens',
    locality: 'Sarjapur Road, Varthur Hub',
    city: 'Bengaluru',
    price: '₹1.12 Cr',
    pricePerSqFt: '₹4,666/sq.ft',
    dimensions: '40x60 ft (2,400 sq.ft)',
    facing: 'North-East Facing',
    tag: 'BMRDA Approved',
    category: 'gated',
    verified: true,
    isSaved: true,
    activeImageIndex: 0,
    images: [
      'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=800&q=80'
    ]
  },
  {
    id: 103,
    title: '30x40 Prime Residential Plot near Airport',
    locality: 'Yelahanka Extension, Bengaluru',
    price: '₹48.0 L',
    pricePerSqFt: '₹4,000/sq.ft',
    dimensions: '30x40 ft (1,200 sq.ft)',
    facing: 'North Facing',
    tag: 'Direct Owner',
    category: 'corner',
    verified: true,
    isSaved: false,
    activeImageIndex: 0,
    images: [
      'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80'
    ]
  },
  {
    id: 104,
    title: '1/2 Acre Eco-Agri Managed Farmland',
    locality: 'Doddaballapur Road, Bengaluru',
    price: '₹65.0 L',
    pricePerSqFt: '₹2,980/sq.ft',
    dimensions: '21,780 sq.ft (0.5 Acre)',
    facing: 'East Facing',
    tag: 'Clear Title E-Katha',
    category: 'agri',
    verified: false,
    isSaved: false,
    activeImageIndex: 0,
    images: [
      'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80'
    ]
  },
  {
    id: 105,
    title: 'Corner Commercial Main Road Site',
    locality: 'Hosur Main Road, Attibele Hub',
    city: 'Bengaluru',
    price: '₹1.85 Cr',
    pricePerSqFt: '₹6,166/sq.ft',
    dimensions: '50x60 ft (3,000 sq.ft)',
    facing: 'North-East Corner',
    tag: 'Commercial Katha',
    category: 'commercial',
    verified: true,
    isSaved: false,
    activeImageIndex: 0,
    images: [
      'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80'
    ]
  }
])

// --- CAROUSEL CONTROLS ---
const nextImage = (plot) => {
  if (plot.activeImageIndex < plot.images.length - 1) {
    plot.activeImageIndex++
  } else {
    plot.activeImageIndex = 0
  }
}

const prevImage = (plot) => {
  if (plot.activeImageIndex > 0) {
    plot.activeImageIndex--
  } else {
    plot.activeImageIndex = plot.images.length - 1
  }
}

const toggleSave = (plot) => {
  plot.isSaved = !plot.isSaved
}

// Filtered Results Logic
const filteredPlots = computed(() => {
  return plotListings.value.filter(plot => {
    if (selectedCategory.value !== 'all' && plot.category !== selectedCategory.value) return false
    if (filters.value.verifiedOnly && !plot.verified) return false
    if (filters.value.searchQuery) {
      const q = filters.value.searchQuery.toLowerCase()
      return plot.title.toLowerCase().includes(q) || plot.locality.toLowerCase().includes(q)
    }
    return true
  })
})

const resetFilters = () => {
  selectedCategory.value = 'all'
  filters.value = {
    searchQuery: '',
    approvalType: 'all',
    facing: 'all',
    plotDimension: 'all',
    minPrice: '',
    maxPrice: '',
    verifiedOnly: false,
    directOwnerOnly: false
  }
}
</script>

<template>
  <Head title="Search & Explore Plots | Official Plot Finder" />

  <div class="min-h-screen bg-slate-50 text-slate-800 pb-24 md:pb-12 font-sans antialiased">

    <!-- 1. STICKY OFFICIAL HEADER & SEARCH BAR -->
    <header class="sticky top-0 z-40 bg-white/90 backdrop-blur-md border-b border-slate-200/80 shadow-2xs">
      <div class="max-w-4xl mx-auto px-4 h-16 flex items-center justify-between gap-3">
        
        <!-- Brand / Back Button -->
        <Link href="/" class="flex items-center gap-2 shrink-0">
          <div class="w-9 h-9 rounded-2xl bg-emerald-600 flex items-center justify-center text-white font-black text-xl shadow-xs">
            ∞
          </div>
          <span class="text-base font-extrabold tracking-tight text-slate-900 hidden sm:inline-block">
            Plot<span class="text-emerald-600">Finder</span>
          </span>
        </Link>

        <!-- Search Bar Input -->
        <div class="flex-1 relative">
          <Icon icon="lucide:search" class="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
          <input 
            v-model="filters.searchQuery"
            type="text" 
            placeholder="Search locality, layout, or dimensions..." 
            class="w-full bg-slate-100 focus:bg-white text-xs font-semibold text-slate-900 pl-10 pr-9 py-2.5 rounded-full border border-transparent focus:border-emerald-500 focus:outline-none transition shadow-inner"
          />
          <button 
            v-if="filters.searchQuery" 
            @click="filters.searchQuery = ''"
            class="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600">
            <Icon icon="lucide:x" class="w-4 h-4" />
          </button>
        </div>

        <!-- Filter Modal Trigger -->
        <button 
          @click="showFilterDrawer = true"
          class="flex items-center gap-1.5 bg-slate-900 text-white px-3.5 py-2.5 rounded-full text-xs font-bold hover:bg-slate-800 transition shrink-0 shadow-sm cursor-pointer">
          <Icon icon="lucide:sliders-horizontal" class="w-4 h-4 text-emerald-400" />
          <span class="hidden sm:inline">Filters</span>
          <span v-if="filters.verifiedOnly || selectedCategory !== 'all'" class="w-2 h-2 rounded-full bg-emerald-400"></span>
        </button>

      </div>

      <!-- Quick Category Pills Horizontal Bar -->
      <div class="border-t border-slate-100 bg-white px-4 py-2">
        <div class="max-w-4xl mx-auto flex items-center gap-2 overflow-x-auto no-scrollbar">
          <button 
            v-for="cat in quickFilters" 
            :key="cat.id"
            @click="selectedCategory = cat.id"
            :class="selectedCategory === cat.id ? 'bg-emerald-600 text-white font-bold shadow-xs' : 'bg-slate-100 text-slate-600 hover:bg-slate-200 font-semibold'"
            class="flex items-center gap-1.5 text-xs px-3.5 py-1.5 rounded-full whitespace-nowrap transition cursor-pointer shrink-0">
            <Icon :icon="cat.icon" class="w-3.5 h-3.5" />
            <span>{{ cat.label }}</span>
          </button>
        </div>
      </div>
    </header>

    <!-- 2. MAIN VERTICAL CAROUSEL FEED CONTAINER -->
    <main class="max-w-xl mx-auto px-4 mt-6">
      
      <!-- Feed Summary Banner -->
      <div class="flex items-center justify-between mb-4 px-1">
        <div>
          <h1 class="text-base font-extrabold text-slate-900">Available Land & Plot Sites</h1>
          <p class="text-xs text-slate-500">Swipe photos directly on the card to explore</p>
        </div>
        <span class="text-xs font-bold bg-emerald-50 text-emerald-700 px-2.5 py-1 rounded-full border border-emerald-100">
          {{ filteredPlots.length }} Verified Plots
        </span>
      </div>

      <!-- VERTICAL FEED OF HIGH-ENGAGEMENT INSTA-STYLE CARDS -->
      <div class="space-y-6">
        <article 
          v-for="plot in filteredPlots" 
          :key="plot.id"
          class="relative w-full h-[460px] rounded-[2rem] overflow-hidden group cursor-pointer shadow-md hover:shadow-2xl transition-all duration-300 border border-slate-200/60 bg-slate-900">
          
          <!-- IMAGE CAROUSEL CONTAINER -->
          <div class="absolute inset-0 w-full h-full">
            <!-- Images -->
            <img 
              :src="plot.images[plot.activeImageIndex]" 
              :alt="plot.title" 
              class="w-full h-full object-cover transition-all duration-500 group-hover:scale-105" 
            />

            <!-- Dark Gradient Overlay for Readability -->
            <div class="absolute inset-0 bg-gradient-to-t from-slate-950/95 via-slate-900/30 to-slate-950/20"></div>

            <!-- Left & Right Carousel Swipe Controls -->
            <div v-if="plot.images.length > 1" class="absolute inset-x-2 top-1/2 -translate-y-1/2 flex justify-between pointer-events-none z-20">
              <button 
                @click.stop="prevImage(plot)"
                class="pointer-events-auto w-8 h-8 rounded-full bg-slate-950/40 backdrop-blur-md text-white flex items-center justify-center opacity-80 hover:opacity-100 hover:bg-slate-950/80 transition shadow-xs">
                <Icon icon="lucide:chevron-left" class="w-5 h-5" />
              </button>
              <button 
                @click.stop="nextImage(plot)"
                class="pointer-events-auto w-8 h-8 rounded-full bg-slate-950/40 backdrop-blur-md text-white flex items-center justify-center opacity-80 hover:opacity-100 hover:bg-slate-950/80 transition shadow-xs">
                <Icon icon="lucide:chevron-right" class="w-5 h-5" />
              </button>
            </div>

            <!-- Carousel Pagination Dots -->
            <div v-if="plot.images.length > 1" class="absolute top-4 inset-x-0 flex justify-center gap-1.5 z-20">
              <span 
                v-for="(img, idx) in plot.images" 
                :key="idx"
                :class="idx === plot.activeImageIndex ? 'w-5 bg-emerald-400' : 'w-1.5 bg-white/50'"
                class="h-1.5 rounded-full transition-all duration-300">
              </span>
            </div>
          </div>

          <!-- TOP BADGES & ACTIONS -->
          <div class="absolute top-4 left-4 right-4 flex items-center justify-between z-20">
            <!-- Approval Tag -->
            <div class="bg-white/20 backdrop-blur-md border border-white/30 text-white text-[11px] font-bold px-3.5 py-1.5 rounded-full flex items-center gap-1 shadow-sm">
              <Icon icon="lucide:check-circle" class="w-3.5 h-3.5 text-emerald-400" />
              <span>{{ plot.tag }}</span>
            </div>

            <!-- Bookmark Button -->
            <button 
              @click.stop="toggleSave(plot)"
              class="w-10 h-10 rounded-full bg-white/20 backdrop-blur-md border border-white/30 flex items-center justify-center text-white hover:text-red-400 transition shadow-sm">
              <Icon icon="lucide:heart" :class="plot.isSaved ? 'fill-red-500 text-red-500' : ''" class="w-5 h-5" />
            </button>
          </div>

          <!-- BOTTOM PLOT DETAILS SECTION -->
          <div class="absolute bottom-5 left-5 right-5 z-20">
            
            <!-- Plot Dimension Specs Pill -->
            <div class="inline-flex items-center gap-2 bg-slate-900/80 backdrop-blur-md text-slate-200 text-[11px] font-semibold px-3 py-1 rounded-lg border border-white/10 mb-2">
              <span>{{ plot.dimensions }}</span>
              <span>•</span>
              <span>{{ plot.facing }}</span>
            </div>

            <h3 class="text-white font-black text-lg sm:text-xl leading-snug mb-1 drop-shadow-sm">
              {{ plot.title }}
            </h3>

            <p class="text-slate-300 text-xs flex items-center gap-1 mb-3">
              <Icon icon="lucide:map-pin" class="w-3.5 h-3.5 text-emerald-400 shrink-0" /> 
              <span>{{ plot.locality }}</span>
            </p>

            <!-- Price & Action Button -->
            <div class="flex items-center justify-between pt-2 border-t border-white/15">
              <div>
                <span class="text-emerald-400 font-extrabold text-2xl leading-none block">{{ plot.price }}</span>
                <span class="text-slate-300 text-[10px] font-medium">{{ plot.pricePerSqFt }}</span>
              </div>

              <div class="flex items-center gap-2">
                <button class="bg-white/20 backdrop-blur-md border border-white/30 hover:bg-white hover:text-slate-900 text-white text-xs font-bold px-3.5 py-2.5 rounded-full transition flex items-center gap-1">
                  <Icon icon="lucide:phone" class="w-3.5 h-3.5" />
                  <span>Call</span>
                </button>

                <div class="w-10 h-10 rounded-full bg-emerald-500 text-white flex items-center justify-center group-hover:bg-emerald-400 group-hover:scale-105 transition shadow-lg">
                  <Icon icon="lucide:arrow-right" class="w-5 h-5" />
                </div>
              </div>
            </div>

          </div>
        </article>
      </div>

    </main>

    <!-- 3. SLIDING FILTER MODAL DRAWER -->
    <div v-if="showFilterDrawer" class="fixed inset-0 z-50 flex justify-end">
      <!-- Backdrop -->
      <div @click="showFilterDrawer = false" class="fixed inset-0 bg-slate-950/60 backdrop-blur-xs transition-opacity"></div>

      <!-- Drawer Content -->
      <div class="relative w-full max-w-sm bg-white h-full shadow-2xl flex flex-col justify-between z-10 p-6 overflow-y-auto">
        <div>
          <div class="flex items-center justify-between pb-4 border-b border-slate-100 mb-5">
            <div>
              <h3 class="text-base font-extrabold text-slate-900 flex items-center gap-2">
                <Icon icon="lucide:sliders-horizontal" class="w-4 h-4 text-emerald-600" />
                Refine Plot Search
              </h3>
              <p class="text-xs text-slate-500">Filter land by approval, facing & budget</p>
            </div>
            <button @click="showFilterDrawer = false" class="p-1 text-slate-400 hover:text-slate-600 rounded-lg">
              <Icon icon="lucide:x" class="w-5 h-5" />
            </button>
          </div>

          <!-- Form Controls -->
          <div class="space-y-4">
            <!-- Verified Switch -->
            <div class="flex items-center justify-between p-3.5 bg-emerald-50/80 rounded-2xl border border-emerald-100">
              <div>
                <span class="text-xs font-bold text-emerald-950 block">Title Verified Only</span>
                <span class="text-[10px] text-emerald-700">Clear legal title & land approvals</span>
              </div>
              <input type="checkbox" v-model="filters.verifiedOnly" class="w-4 h-4 accent-emerald-600 rounded cursor-pointer" />
            </div>

            <!-- Approval Select -->
            <div>
              <label class="text-[11px] font-bold text-slate-500 uppercase tracking-wider block mb-1.5">Authority Approval</label>
              <select v-model="filters.approvalType" class="w-full bg-slate-50 border border-slate-200 text-xs font-semibold rounded-xl p-3 focus:outline-none focus:border-emerald-500">
                <option value="all">All Approval Types</option>
                <option value="biappa">BIAPPA / BDA / BMRDA</option>
                <option value="rera">RERA Registered</option>
                <option value="ekatha">E-Katha Cleared</option>
                <option value="converted">DC Converted</option>
              </select>
            </div>

            <!-- Facing Direction -->
            <div>
              <label class="text-[11px] font-bold text-slate-500 uppercase tracking-wider block mb-1.5">Vastu / Facing</label>
              <select v-model="filters.facing" class="w-full bg-slate-50 border border-slate-200 text-xs font-semibold rounded-xl p-3 focus:outline-none focus:border-emerald-500">
                <option value="all">Any Facing</option>
                <option value="east">East Facing</option>
                <option value="north">North Facing</option>
                <option value="ne">North-East Corner</option>
                <option value="west">West Facing</option>
              </select>
            </div>

            <!-- Plot Dimensions -->
            <div>
              <label class="text-[11px] font-bold text-slate-500 uppercase tracking-wider block mb-1.5">Standard Plot Dimensions</label>
              <select v-model="filters.plotDimension" class="w-full bg-slate-50 border border-slate-200 text-xs font-semibold rounded-xl p-3 focus:outline-none focus:border-emerald-500">
                <option value="all">All Sizes</option>
                <option value="30x40">30 x 40 ft (1,200 sq.ft)</option>
                <option value="30x50">30 x 50 ft (1,500 sq.ft)</option>
                <option value="40x60">40 x 60 ft (2,400 sq.ft)</option>
                <option value="50x80">50 x 80 ft (4,000 sq.ft)</option>
              </select>
            </div>

            <!-- Budget Range -->
            <div>
              <label class="text-[11px] font-bold text-slate-500 uppercase tracking-wider block mb-1.5">Budget Range (Lakhs)</label>
              <div class="grid grid-cols-2 gap-2">
                <input v-model="filters.minPrice" type="number" placeholder="Min ₹" class="bg-slate-50 border border-slate-200 text-xs font-semibold p-3 rounded-xl focus:outline-none focus:border-emerald-500" />
                <input v-model="filters.maxPrice" type="number" placeholder="Max ₹" class="bg-slate-50 border border-slate-200 text-xs font-semibold p-3 rounded-xl focus:outline-none focus:border-emerald-500" />
              </div>
            </div>
          </div>
        </div>

        <!-- Filter Drawer Bottom Actions -->
        <div class="pt-4 border-t border-slate-100 flex gap-2">
          <button @click="resetFilters" class="w-1/3 py-3 text-xs font-bold text-slate-600 bg-slate-100 rounded-xl hover:bg-slate-200 transition">
            Reset
          </button>
          <button @click="showFilterDrawer = false" class="w-2/3 py-3 text-xs font-bold text-white bg-emerald-600 rounded-xl shadow-md hover:bg-emerald-700 transition">
            Apply Filters
          </button>
        </div>
      </div>
    </div>

    <!-- 4. BOTTOM MOBILE NAVIGATION -->
    <nav class="md:hidden fixed bottom-0 left-0 right-0 bg-white/95 backdrop-blur-md border-t border-slate-200 px-6 py-2 flex items-center justify-between z-40 shadow-lg">
      <Link href="/" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:home" class="w-5 h-5" />
        <span class="text-[10px] font-medium">Home</span>
      </Link>
      
      <Link href="/search" class="flex flex-col items-center gap-0.5 text-emerald-600">
        <Icon icon="lucide:search" class="w-5 h-5" />
        <span class="text-[10px] font-bold">Search</span>
      </Link>

      <Link href="/post-plot" class="flex flex-col items-center gap-0.5 text-slate-400">
        <div class="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm -mt-4 shadow-md border-2 border-white">
          <Icon icon="lucide:plus" class="w-4 h-4" />
        </div>
        <span class="text-[10px] font-medium">Post Plot</span>
      </Link>

      <Link href="/saved" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:heart" class="w-5 h-5" />
        <span class="text-[10px] font-medium">Saved</span>
      </Link>

      <Link href="/menu" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:menu" class="w-5 h-5" />
        <span class="text-[10px] font-medium">Menu</span>
      </Link>
    </nav>

  </div>
</template>

<style scoped>
.no-scrollbar::-webkit-scrollbar {
  display: none;
}
.no-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>