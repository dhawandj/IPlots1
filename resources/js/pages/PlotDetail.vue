<script setup>
import { ref } from 'vue'
import { Link, Head } from '@inertiajs/vue3'
import { Icon } from '@iconify/vue'

// --- MOCK PROPS / DATA FOR SELECTED PLOT ---
const plot = ref({
  id: 101,
  title: '30x50 East Facing Prime Plot in Prestige Marigold Phase 2',
  locality: 'Bettenahalli, Devanahalli',
  city: 'Bengaluru',
  pincode: '562110',
  priceDisplay: '₹72.5 Lakhs',
  pricePerSqFt: '₹4,833 / sq.ft',
  negotiable: true,
  postedDate: '3 days ago',
  
  // Specific Land Metrics
  areaSqFt: '1,500 sq.ft',
  dimensions: '30 x 50 ft',
  facing: 'East Facing',
  roadWidth: '40 Feet Wide Road',
  boundaryWall: 'Constructed (4 Feet)',
  cornerPlot: false,

  // Legal & Approval Badges
  approvals: ['BIAPPA Approved', 'RERA Registered', 'E-Katha Cleared'],
  reraNumber: 'PRM/KA/RERA/1250/303/PR/210928/004321',

  // Seller Details
  seller: {
    name: 'Rajesh Nambiar',
    role: 'Direct Owner',
    phone: '+91 98765 43210',
    verifiedSeller: true,
    memberSince: 'Jan 2023',
    responseRate: '100%'
  },

  // Gallery Images & Layout Map
  activeImageIndex: 0,
  images: [
    'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=1200&q=80',
    'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=1200&q=80',
    'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=1200&q=80',
    'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=1200&q=80'
  ],
  layoutPlanUrl: 'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=1200&q=80',

  // Overview Description
  description: `Excellently located 30x50 East facing residential plot in Prestige Marigold Phase 2 layout, Devanahalli. The layout features 40ft asphalt roads, underground drainage, electricity cables, water connections ready to connect, and 24x7 security gated entry. Situated just 12 minutes drive from Kempegowda International Airport and close to upcoming Metro Phase 2B line. Clear title deeds, single owner property with 100% legal clearance verified by bank panel advocates.`,

  // Amenities & Infrastructure
  amenities: [
    { name: 'Underground Power Cable', icon: 'lucide:zap' },
    { name: 'Paved 40ft Asphalt Road', icon: 'lucide:car' },
    { name: 'Gated Security & CCTV', icon: 'lucide:shield-check' },
    { name: 'Water Pipe Connection', icon: 'lucide:droplets' },
    { name: 'Sewage Treatment Plant', icon: 'lucide:recycle' },
    { name: 'Park & Children Play Area', icon: 'lucide:trees' }
  ],

  // Verification Documents Status
  legalVerification: [
    { title: 'Title Deed (Mother Deed)', status: 'Verified', statusColor: 'text-emerald-600 bg-emerald-50' },
    { title: 'Encumbrance Certificate (EC)', status: '15 Yrs Clear', statusColor: 'text-emerald-600 bg-emerald-50' },
    { title: 'Katha Status', status: 'E-Katha Available', statusColor: 'text-emerald-600 bg-emerald-50' },
    { title: 'Bank Loan Eligibility', status: 'Pre-Approved (SBI/HDFC)', statusColor: 'text-blue-600 bg-blue-50' }
  ]
})

const isSaved = ref(false)
const showContactModal = ref(false)

const toggleSave = () => {
  isSaved.value = !isSaved.value
}
</script>

<template>
  <Head :title="plot.title + ' | Infinity Plots'" />

  <div class="min-h-screen bg-slate-50 text-slate-800 pb-28 md:pb-12 font-sans antialiased">
    
    <!-- 1. STICKY TOP NAVBAR -->
    <header class="sticky top-0 z-40 bg-white/90 backdrop-blur-md border-b border-slate-200/80 shadow-2xs">
      <div class="max-w-4xl mx-auto px-4 h-14 flex items-center justify-between">
        <Link href="/search" class="flex items-center gap-1.5 text-slate-600 hover:text-slate-900 font-bold text-xs">
          <Icon icon="lucide:arrow-left" class="w-4 h-4" />
          <span>Back to Search</span>
        </Link>

        <div class="flex items-center gap-2">
          <button 
            @click="toggleSave"
            class="w-9 h-9 rounded-full bg-slate-100 flex items-center justify-center transition"
            :class="isSaved ? 'text-red-500 bg-red-50' : 'text-slate-600 hover:bg-slate-200'">
            <Icon icon="lucide:heart" :class="isSaved ? 'fill-current' : ''" class="w-4 h-4" />
          </button>
          
          <button class="w-9 h-9 rounded-full bg-slate-100 flex items-center justify-center text-slate-600 hover:bg-slate-200 transition">
            <Icon icon="lucide:share-2" class="w-4 h-4" />
          </button>
        </div>
      </div>
    </header>

    <!-- MAIN PLOT DETAIL BODY -->
    <main class="max-w-4xl mx-auto px-4 pt-4 space-y-6">

      <!-- 2. GALLERY CAROUSEL SECTION -->
      <section class="bg-slate-900 rounded-[2rem] overflow-hidden shadow-lg relative">
        <div class="relative h-72 sm:h-96 w-full overflow-hidden">
          <img 
            :src="plot.images[plot.activeImageIndex]" 
            :alt="plot.title" 
            class="w-full h-full object-cover transition-all duration-500" 
          />
          <div class="absolute inset-0 bg-gradient-to-t from-slate-950/80 via-transparent to-black/20"></div>

          <!-- Top Overlay Badges -->
          <div class="absolute top-4 left-4 flex flex-wrap gap-2">
            <span class="bg-emerald-600 text-white text-[11px] font-bold px-3 py-1 rounded-full shadow-sm flex items-center gap-1">
              <Icon icon="lucide:shield-check" class="w-3.5 h-3.5" />
              100% Legal Title Cleared
            </span>
            <span class="bg-slate-900/80 backdrop-blur-md text-white text-[11px] font-medium px-3 py-1 rounded-full">
              {{ plot.seller.role }}
            </span>
          </div>

          <!-- Image Indicator Counter -->
          <div class="absolute bottom-4 right-4 bg-slate-950/70 backdrop-blur-md text-white text-xs font-bold px-3 py-1 rounded-full">
            {{ plot.activeImageIndex + 1 }} / {{ plot.images.length }} Photos
          </div>
        </div>

        <!-- Thumbnails Strip -->
        <div class="p-3 bg-slate-950 flex gap-2 overflow-x-auto no-scrollbar border-t border-white/10">
          <button 
            v-for="(img, idx) in plot.images" 
            :key="idx"
            @click="plot.activeImageIndex = idx"
            :class="idx === plot.activeImageIndex ? 'border-2 border-emerald-400 opacity-100 scale-105' : 'opacity-50 hover:opacity-100'"
            class="w-16 h-16 rounded-xl overflow-hidden shrink-0 transition cursor-pointer">
            <img :src="img" class="w-full h-full object-cover" />
          </button>
        </div>
      </section>

      <!-- 3. TITLE, LOCATION & PRICE SUMMARY -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <div class="flex items-start justify-between gap-4 mb-2">
          <div>
            <span class="text-[10px] font-bold text-slate-400 uppercase tracking-wider block mb-1">
              Posted {{ plot.postedDate }}
            </span>
            <h1 class="text-lg sm:text-2xl font-black text-slate-900 leading-tight">
              {{ plot.title }}
            </h1>
          </div>
        </div>

        <p class="text-xs sm:text-sm text-slate-500 font-medium flex items-center gap-1 mb-4">
          <Icon icon="lucide:map-pin" class="w-4 h-4 text-emerald-600 shrink-0" />
          <span>{{ plot.locality }}, {{ plot.city }} - {{ plot.pincode }}</span>
        </p>

        <!-- Price Breakdown Card -->
        <div class="bg-slate-50 rounded-2xl p-4 border border-slate-100 flex items-center justify-between">
          <div>
            <span class="text-[10px] font-bold text-slate-400 uppercase block">Asking Price</span>
            <div class="flex items-baseline gap-2">
              <span class="text-2xl font-black text-slate-900">{{ plot.priceDisplay }}</span>
              <span v-if="plot.negotiable" class="text-[10px] font-bold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-100">
                Negotiable
              </span>
            </div>
          </div>
          <div class="text-right">
            <span class="text-[10px] font-bold text-slate-400 uppercase block">Rate per Sq.Ft</span>
            <span class="text-sm font-bold text-slate-700">{{ plot.pricePerSqFt }}</span>
          </div>
        </div>
      </section>

      <!-- 4. KEY LAND METRICS & SPECIFICATIONS GRID -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-4">
          Plot Specifications & Dimensions
        </h3>

        <div class="grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Plot Area</span>
            <span class="text-sm font-black text-slate-900">{{ plot.areaSqFt }}</span>
          </div>

          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Dimensions</span>
            <span class="text-sm font-black text-slate-900">{{ plot.dimensions }}</span>
          </div>

          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Vastu / Facing</span>
            <span class="text-sm font-black text-slate-900">{{ plot.facing }}</span>
          </div>

          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Approach Road</span>
            <span class="text-sm font-black text-slate-900">{{ plot.roadWidth }}</span>
          </div>

          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Boundary Wall</span>
            <span class="text-sm font-black text-slate-900">{{ plot.boundaryWall }}</span>
          </div>

          <div class="bg-slate-50 rounded-2xl p-3 border border-slate-100">
            <span class="text-[10px] text-slate-400 font-bold uppercase block mb-0.5">Corner Site</span>
            <span class="text-sm font-black text-slate-900">{{ plot.cornerPlot ? 'Yes (2 Roads)' : 'No' }}</span>
          </div>
        </div>
      </section>

      <!-- 5. LEGAL & APPROVAL CHECKLIST -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <div class="flex items-center justify-between mb-4">
          <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider">
            Legal Approvals & Verification
          </h3>
          <span class="text-[10px] font-extrabold text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded-full border border-emerald-100 flex items-center gap-1">
            <Icon icon="lucide:check-circle-2" class="w-3.5 h-3.5" /> Checked
          </span>
        </div>

        <div class="flex flex-wrap gap-2 mb-4">
          <span 
            v-for="approval in plot.approvals" 
            :key="approval" 
            class="text-xs font-bold bg-blue-50 text-blue-700 px-3 py-1.5 rounded-xl border border-blue-100 flex items-center gap-1.5">
            <Icon icon="lucide:award" class="w-4 h-4 text-blue-600" />
            {{ approval }}
          </span>
        </div>

        <div class="bg-slate-50 rounded-2xl p-3.5 border border-slate-100 mb-4">
          <span class="text-[10px] text-slate-400 font-bold block uppercase">RERA Registration No.</span>
          <span class="text-xs font-extrabold text-slate-800 font-mono select-all">{{ plot.reraNumber }}</span>
        </div>

        <!-- Verification Checklist Table -->
        <div class="divide-y divide-slate-100">
          <div 
            v-for="item in plot.legalVerification" 
            :key="item.title" 
            class="py-2.5 flex items-center justify-between text-xs font-semibold">
            <span class="text-slate-700">{{ item.title }}</span>
            <span :class="[item.statusColor, 'px-2.5 py-0.5 rounded-md font-bold text-[10px]']">
              {{ item.status }}
            </span>
          </div>
        </div>
      </section>

      <!-- 6. DESCRIPTION & OVERVIEW -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-3">
          Property Description
        </h3>
        <p class="text-xs sm:text-sm text-slate-600 font-medium leading-relaxed whitespace-pre-line">
          {{ plot.description }}
        </p>
      </section>

      <!-- 7. INFRASTRUCTURE & AMENITIES -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-4">
          Layout Infrastructure & Facilities
        </h3>

        <div class="grid grid-cols-2 sm:grid-cols-3 gap-3">
          <div 
            v-for="amenity in plot.amenities" 
            :key="amenity.name" 
            class="flex items-center gap-2.5 p-2.5 rounded-2xl bg-slate-50 border border-slate-100">
            <div class="w-8 h-8 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center shrink-0">
              <Icon :icon="amenity.icon" class="w-4 h-4" />
            </div>
            <span class="text-xs font-bold text-slate-800 leading-tight">{{ amenity.name }}</span>
          </div>
        </div>
      </section>

      <!-- 8. SELLER / OWNER PROFILE CARD -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-2xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-4">
          Posted By
        </h3>

        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="w-12 h-12 rounded-2xl bg-slate-900 text-white font-black text-lg flex items-center justify-center shadow-sm">
              {{ plot.seller.name.split(' ').map(n => n[0]).join('') }}
            </div>
            <div>
              <div class="flex items-center gap-1.5">
                <h4 class="text-sm font-extrabold text-slate-900">{{ plot.seller.name }}</h4>
                <Icon icon="lucide:check-circle-2" class="w-4 h-4 text-emerald-500 fill-emerald-100" />
              </div>
              <span class="text-[11px] text-slate-500 font-medium block">{{ plot.seller.role }} • Member since {{ plot.seller.memberSince }}</span>
            </div>
          </div>

          <div class="text-right">
            <span class="text-[10px] font-bold text-slate-400 block uppercase">Response</span>
            <span class="text-xs font-bold text-emerald-600">{{ plot.seller.responseRate }}</span>
          </div>
        </div>
      </section>

    </main>

    <!-- 9. FIXED BOTTOM CONTACT BAR (MOBILE & DESKTOP) -->
    <div class="fixed bottom-0 left-0 right-0 bg-white/95 backdrop-blur-md border-t border-slate-200/80 p-4 z-40 shadow-lg">
      <div class="max-w-4xl mx-auto flex items-center justify-between gap-3">
        
        <div>
          <span class="text-[10px] font-bold text-slate-400 uppercase block">Total Price</span>
          <span class="text-lg font-black text-slate-900 leading-none">{{ plot.priceDisplay }}</span>
        </div>

        <div class="flex items-center gap-2">
          <!-- Get Layout Plan Button -->
          <button 
            @click="showContactModal = true"
            class="bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-bold px-4 py-3 rounded-2xl transition flex items-center gap-1.5 cursor-pointer">
            <Icon icon="lucide:file-text" class="w-4 h-4 text-slate-500" />
            <span class="hidden sm:inline">Layout Plan</span>
          </button>

          <!-- Call Owner Button -->
          <a 
            :href="'tel:' + plot.seller.phone"
            class="bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold px-5 py-3 rounded-2xl shadow-md transition flex items-center gap-2 cursor-pointer">
            <Icon icon="lucide:phone" class="w-4 h-4" />
            <span>Contact Owner</span>
          </a>
        </div>

      </div>
    </div>

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