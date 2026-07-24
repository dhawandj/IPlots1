<script setup>
import { ref } from 'vue'
import { Link, Head } from '@inertiajs/vue3'
import { Icon } from '@iconify/vue'

// --- STATE & DATA ---
const currentCity = ref('Bengaluru')
const cities = ['Bengaluru', 'Hyderabad', 'Chennai', 'Pune', 'Mumbai']

const activeTab = ref('buy') // 'buy', 'gated', 'invest'

const searchQuery = ref({
  locality: '',
  plotType: 'all',
  maxBudget: ''
})

// Horizontal Capsule Categories (Capsule-like Pills)
const capsuleCategories = [
  { id: 'all', name: 'All Plots', icon: 'lucide:layers' },
  { id: 'residential', name: 'Residential Lands', icon: 'lucide:map-pin' },
  { id: 'gated', name: 'Gated Communities', icon: 'lucide:shield-check' },
  { id: 'commercial', name: 'Commercial Sites', icon: 'lucide:building-2' },
  { id: 'farmland', name: 'Agricultural & Agri', icon: 'lucide:sprout' },
  { id: 'corner', name: 'Corner Plots', icon: 'lucide:compass' },
  { id: 'east', name: 'East Facing Vastu', icon: 'lucide:sun' },
  { id: 'metro', name: 'Near Metro Corridor', icon: 'lucide:train' },
]

// Premium Projects Data for Exclusive Gated Communities
const premiumProjects = ref([
  {
    id: 301,
    title: 'Prestige Sanctuary Estates',
    locality: 'Nandi Hills, Bengaluru',
    price: '₹1.25 Cr+',
    tag: 'Luxury Gated',
    image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80'
  },
  {
    id: 302,
    title: 'Sobha Oakshire Reserve',
    locality: 'Devanahalli, Bengaluru',
    price: '₹85 L+',
    tag: 'RERA & BIAPPA',
    image: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=800&q=80'
  },
  {
    id: 303,
    title: 'Godrej Woodland Enclave',
    locality: 'Sarjapur East, Bengaluru',
    price: '₹95 L+',
    tag: 'Clubhouse Included',
    image: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80'
  },
  {
    id: 304,
    title: 'Purva Tranquillity Phase 2',
    locality: 'S Medihalli, Bengaluru',
    price: '₹68 L+',
    tag: 'Eco-Living',
    image: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80'
  }
])

// Portrait Cards: Hot Handpicked Plots (Horizontal Scroll)
const portraitPlots = ref([
  {
    id: 201,
    title: '30x40 East Facing Plot in Devanahalli',
    locality: 'Devanahalli, Bengaluru',
    price: '₹48.5 L',
    pricePerSqFt: '₹4,041/sqft',
    dimensions: '1,200 sq.ft',
    tag: 'Hot Deal',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=600&q=80',
    verified: true
  },
  {
    id: 202,
    title: '40x60 BMRDA Approved Corner Land',
    locality: 'Sarjapur Road, Bengaluru',
    price: '₹1.12 Cr',
    pricePerSqFt: '₹4,666/sqft',
    dimensions: '2,400 sq.ft',
    tag: 'RERA Clear',
    image: 'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=600&q=80',
    verified: true
  },
  {
    id: 203,
    title: 'Premium Villa Plot near Airport Road',
    locality: 'Yelahanka, Bengaluru',
    price: '₹82.0 L',
    pricePerSqFt: '₹5,466/sqft',
    dimensions: '1,500 sq.ft',
    tag: 'Gated Township',
    image: 'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=600&q=80',
    verified: true
  },
  {
    id: 204,
    title: '1/2 Acre Agri Farmland with Water Source',
    locality: 'Doddaballapur, Bengaluru',
    price: '₹65.0 L',
    pricePerSqFt: '₹2,980/sqft',
    dimensions: '21,780 sq.ft',
    tag: 'Farm Plot',
    image: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=600&q=80',
    verified: false
  }
])

// Bento Box Categories
const bentoCategories = [
  {
    id: 'gated-bento',
    title: 'Gated Townships',
    subtitle: 'Security, Clubhouse & Parks',
    count: '1,240+ Plots',
    image: 'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80',
    span: 'col-span-1 sm:col-span-2 md:col-span-2 row-span-2',
    accentColor: 'from-emerald-900/90 to-slate-900/80',
    icon: 'lucide:shield-check'
  },
  {
    id: 'rera-bento',
    title: '100% RERA & Legal Verified',
    subtitle: 'Clear Title Deeds',
    count: '3,100+ Lands',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80',
    span: 'col-span-1 sm:col-span-1 md:col-span-1 row-span-1',
    accentColor: 'from-teal-900/85 to-slate-900/80',
    icon: 'lucide:check-circle-2'
  },
  {
    id: 'commercial-bento',
    title: 'Commercial Plots',
    subtitle: 'High ROI Main Road Sites',
    count: '620+ Locations',
    image: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80',
    span: 'col-span-1 sm:col-span-1 md:col-span-1 row-span-1',
    accentColor: 'from-blue-900/85 to-slate-900/80',
    icon: 'lucide:building-2'
  },
  {
    id: 'farmland-bento',
    title: 'Managed Farmlands',
    subtitle: 'Weekend Getaways & Eco Farming',
    count: '950+ Acres',
    image: 'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&w=800&q=80',
    span: 'col-span-1 sm:col-span-2 md:col-span-3 row-span-1',
    accentColor: 'from-slate-950/80 to-emerald-950/85',
    icon: 'lucide:sprout'
  }
]

// Horizontal Cards: New Layout Launches
const newLaunches = ref([
  {
    id: 101,
    name: 'Sobha Oakshire Layout',
    developer: 'Sobha Developers',
    locality: 'Devanahalli, Bengaluru',
    priceStarting: '₹65 Lakhs',
    totalUnits: '120 Plots',
    approval: 'BIAPPA / RERA',
    tag: 'New Launch',
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80'
  },
  {
    id: 102,
    name: 'Godrej Reserve Phase 2',
    developer: 'Godrej Properties',
    locality: 'Yelahanka Extension',
    priceStarting: '₹88 Lakhs',
    totalUnits: '85 Plots',
    approval: 'BMRDA Approved',
    tag: 'Pre-Launch Offer',
    image: 'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80'
  }
])

// Featured Verified Plot Listings
const featuredPlots = ref([
  {
    id: 1,
    title: 'Prestige Marigold Phase 2 Gated Plot',
    locality: 'Bettenahalli, Devanahalli',
    city: 'Bengaluru',
    priceDisplay: '₹72.5 Lakhs',
    pricePerSqFt: '₹4,833 / sq.ft',
    areaSqFt: '1,500 sq.ft',
    dimensions: '30 x 50 ft',
    facing: 'East Facing',
    approvals: ['BIAPPA', 'RERA Registered'],
    image: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&w=800&q=80',
    sellerType: 'Direct Owner',
    isVerified: true
  },
  {
    id: 2,
    title: 'Corner Plot in Prime Gated Layout',
    locality: 'Sarjapur Main Road',
    city: 'Bengaluru',
    priceDisplay: '₹1.15 Cr',
    pricePerSqFt: '₹4,791 / sq.ft',
    areaSqFt: '2,400 sq.ft',
    dimensions: '40 x 60 ft',
    facing: 'North-East Facing',
    approvals: ['BMRDA Approved', 'E-Katha'],
    image: 'https://images.unsplash.com/photo-1628624747186-a941c476b7ef?auto=format&fit=crop&w=800&q=80',
    sellerType: 'Verified Builder',
    isVerified: true
  },
  {
    id: 3,
    title: 'Investment Plot near Upcoming Metro',
    locality: 'Bagalur Road, Yelahanka',
    city: 'Bengaluru',
    priceDisplay: '₹48.0 Lakhs',
    pricePerSqFt: '₹4,000 / sq.ft',
    areaSqFt: '1,200 sq.ft',
    dimensions: '30 x 40 ft',
    facing: 'West Facing',
    approvals: ['RERA Approved'],
    image: 'https://images.unsplash.com/photo-1524813686514-a57563d77965?auto=format&fit=crop&w=800&q=80',
    sellerType: 'Direct Owner',
    isVerified: true
  }
])

const popularLocalities = [
  { name: 'Devanahalli', city: 'Bengaluru', avgPrice: '₹3,200 / sq.ft', growth: '+14% YoY' },
  { name: 'Sarjapur Road', city: 'Bengaluru', avgPrice: '₹4,500 / sq.ft', growth: '+18% YoY' },
  { name: 'Yelahanka', city: 'Bengaluru', avgPrice: '₹5,100 / sq.ft', growth: '+12% YoY' },
  { name: 'Hosur Road', city: 'Bengaluru', avgPrice: '₹2,800 / sq.ft', growth: '+15% YoY' },
]

const handleSearch = () => {
  console.log('Searching plots:', { city: currentCity.value, ...searchQuery.value })
}
</script>

<template>
  <Head title="Infinity Plots - Verified Land & Plots for Buy & Investment" />

  <div class="min-h-screen bg-slate-50 text-slate-800 pb-20 md:pb-10 font-sans">
    
    <!-- 1. TOP NAVBAR -->
    <header class="sticky top-0 z-40 bg-white shadow-sm border-b border-slate-100">
      <div class="max-w-7xl mx-auto px-4 h-16 flex items-center justify-between gap-2">
        
        <!-- Brand Logo -->
        <Link href="/" class="flex items-center gap-2">
          <div class="w-9 h-9 rounded-xl bg-gradient-to-tr from-emerald-600 to-teal-500 flex items-center justify-center text-white font-black text-xl shadow-md shadow-emerald-200">
            ∞
          </div>
          <div>
            <span class="text-lg font-bold tracking-tight text-slate-900 block leading-tight">Infinity<span class="text-emerald-600">Plots</span></span>
            <span class="text-[10px] text-slate-400 font-medium tracking-wide uppercase block -mt-1">100% Verified Land</span>
          </div>
        </Link>

        <!-- Location Selector -->
        <div class="flex items-center gap-1.5 bg-slate-100 px-3 py-1.5 rounded-full text-xs font-semibold text-slate-700 hover:bg-slate-200 cursor-pointer transition">
          <Icon icon="lucide:map-pin" class="w-3.5 h-3.5 text-emerald-600" />
          <select v-model="currentCity" class="bg-transparent focus:outline-none cursor-pointer pr-1">
            <option v-for="city in cities" :key="city" :value="city">{{ city }}</option>
          </select>
        </div>

        <!-- Desktop Navigation Actions -->
        <div class="hidden md:flex items-center gap-4">
          <Link href="/post-plot" class="text-xs font-semibold px-4 py-2 text-emerald-700 bg-emerald-50 rounded-lg border border-emerald-200 hover:bg-emerald-100 transition flex items-center gap-1.5">
            <Icon icon="lucide:plus-circle" class="w-4 h-4 text-emerald-600" />
            <span>Post Plot</span>
            <span class="bg-emerald-600 text-white text-[10px] px-1.5 py-0.5 rounded ml-0.5 font-bold">FREE</span>
          </Link>
          <Link href="/login" class="text-xs font-semibold px-4 py-2 text-slate-700 hover:text-emerald-600">
            Log In / Register
          </Link>
        </div>
      </div>
    </header>

    <!-- 2. HERO SECTION WITH INTEGRATED SEARCH -->
    <section class="bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900 text-white pt-8 pb-14 px-4 relative overflow-hidden">
      <div class="absolute -top-24 -right-24 w-80 h-80 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none"></div>
      
      <div class="max-w-3xl mx-auto text-center relative z-10">
        <span class="inline-block bg-emerald-500/20 text-emerald-300 text-xs px-3 py-1 rounded-full font-medium mb-3 border border-emerald-500/30">
          Zero Brokerage • Direct Owner Plots
        </span>
        <h1 class="text-2xl sm:text-4xl font-extrabold tracking-tight leading-snug mb-2">
          Find Your Perfect Plot in <span class="text-emerald-400">{{ currentCity }}</span>
        </h1>
        <p class="text-slate-300 text-xs sm:text-sm max-w-lg mx-auto mb-6">
          Explore DTCP, BMRDA & RERA approved residential & commercial land with clear titles.
        </p>

        <!-- Search Card Component -->
        <div class="bg-white rounded-2xl p-3 sm:p-4 text-slate-800 shadow-xl border border-slate-100 text-left">
          <!-- Quick Filter Tabs -->
          <div class="flex items-center gap-2 border-b border-slate-100 pb-3 mb-3">
            <button 
              @click="activeTab = 'buy'" 
              :class="activeTab === 'buy' ? 'bg-emerald-600 text-white font-semibold' : 'text-slate-600 hover:bg-slate-100'"
              class="px-3.5 py-1.5 rounded-lg text-xs transition">
              Residential
            </button>
            <button 
              @click="activeTab = 'gated'" 
              :class="activeTab === 'gated' ? 'bg-emerald-600 text-white font-semibold' : 'text-slate-600 hover:bg-slate-100'"
              class="px-3.5 py-1.5 rounded-lg text-xs transition">
              Gated Community
            </button>
            <button 
              @click="activeTab = 'invest'" 
              :class="activeTab === 'invest' ? 'bg-emerald-600 text-white font-semibold' : 'text-slate-600 hover:bg-slate-100'"
              class="px-3.5 py-1.5 rounded-lg text-xs transition">
              Commercial / Agri
            </button>
          </div>

          <!-- Input Fields Grid -->
          <div class="grid grid-cols-1 sm:grid-cols-3 gap-2.5">
            <div class="relative">
              <label class="text-[10px] uppercase tracking-wider font-bold text-slate-400 block mb-0.5">Locality / Landmark</label>
              <input 
                v-model="searchQuery.locality" 
                type="text" 
                placeholder="e.g. Devanahalli, Sarjapur" 
                class="w-full bg-slate-50 border border-slate-200 text-xs rounded-xl px-3 py-2.5 focus:outline-none focus:ring-2 focus:ring-emerald-500 font-medium"
              />
            </div>

            <div>
              <label class="text-[10px] uppercase tracking-wider font-bold text-slate-400 block mb-0.5">Approval Type</label>
              <select v-model="searchQuery.plotType" class="w-full bg-slate-50 border border-slate-200 text-xs rounded-xl px-3 py-2.5 focus:outline-none focus:ring-2 focus:ring-emerald-500 font-medium">
                <option value="all">All Approvals</option>
                <option value="rera">RERA Approved Only</option>
                <option value="dtcp">DTCP / BDA / HMDA</option>
                <option value="farmland">Agri / Farmland</option>
              </select>
            </div>

            <div>
              <label class="text-[10px] uppercase tracking-wider font-bold text-slate-400 block mb-0.5">Max Budget</label>
              <select v-model="searchQuery.maxBudget" class="w-full bg-slate-50 border border-slate-200 text-xs rounded-xl px-3 py-2.5 focus:outline-none focus:ring-2 focus:ring-emerald-500 font-medium">
                <option value="">Any Budget</option>
                <option value="30L">Up to ₹30 Lakhs</option>
                <option value="50L">Up to ₹50 Lakhs</option>
                <option value="1CR">Up to ₹1 Crore</option>
                <option value="1CR+">Above ₹1 Crore</option>
              </select>
            </div>
          </div>

          <!-- Search CTA Button -->
          <button 
            @click="handleSearch"
            class="w-full mt-3 bg-emerald-600 hover:bg-emerald-700 active:scale-[0.99] text-white font-bold text-xs sm:text-sm py-3 rounded-xl shadow-lg shadow-emerald-600/30 flex items-center justify-center gap-2 transition">
            <Icon icon="lucide:search" class="w-4 h-4 stroke-[2.5]" />
            Search Verified Plots
          </button>
        </div>

      </div>
    </section>

    <!-- 3. CAPSULE-LIKE CURVED CATEGORY STRIP -->
    <section class="max-w-7xl mx-auto px-4 -mt-5 relative z-20">
      <div class="flex gap-2 overflow-x-auto no-scrollbar pb-2 pt-1 items-center">
        <button 
          v-for="cat in capsuleCategories" 
          :key="cat.id"
          class="flex-shrink-0 bg-white hover:bg-emerald-50 border border-slate-200 hover:border-emerald-300 text-slate-700 hover:text-emerald-700 px-4 py-2 rounded-full shadow-sm text-xs font-bold transition-all flex items-center gap-2 group cursor-pointer">
          <Icon :icon="cat.icon" class="w-4 h-4 text-emerald-600 group-hover:scale-110 transition" />
          <span>{{ cat.name }}</span>
        </button>
      </div>
    </section>

    <!-- 4. PREMIUM PROJECTS (PORTRAIT SCROLLING CARDS) -->
    <section class="max-w-7xl mx-auto px-4 mt-10">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900">Exclusive Gated Communities</h2>
          <p class="text-xs text-slate-500">Premium lifestyle plotted developments</p>
        </div>
      </div>

      <div class="flex gap-4 overflow-x-auto no-scrollbar pb-6 pt-2 snap-x">
        <div 
          v-for="project in premiumProjects" 
          :key="project.id"
          class="relative shrink-0 w-60 h-80 rounded-[2rem] overflow-hidden group cursor-pointer snap-start shadow-sm hover:shadow-xl transition-all duration-300">
          
          <img :src="project.image" :alt="project.title" class="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" />
          
          <!-- Gradient Overlay -->
          <div class="absolute inset-0 bg-gradient-to-t from-slate-900/90 via-slate-900/20 to-transparent"></div>
          
          <!-- Tag -->
          <div class="absolute top-4 left-4 bg-white/20 backdrop-blur-md border border-white/30 text-white text-[10px] font-bold px-3 py-1 rounded-full">
            {{ project.tag }}
          </div>
          
          <!-- Details at Bottom -->
          <div class="absolute bottom-4 left-4 right-4">
            <h3 class="text-white font-bold text-base leading-tight mb-1">{{ project.title }}</h3>
            <p class="text-slate-300 text-[11px] flex items-center gap-1 mb-2">
              <Icon icon="lucide:map-pin" class="w-3 h-3 text-emerald-400" /> {{ project.locality }}
            </p>
            <div class="flex items-center justify-between">
              <span class="text-emerald-400 font-extrabold text-lg">{{ project.price }}</span>
              <div class="w-8 h-8 rounded-full bg-white/20 backdrop-blur-md flex items-center justify-center text-white group-hover:bg-emerald-500 transition">
                <Icon icon="lucide:arrow-right" class="w-4 h-4" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 5. PORTRAIT CARDS IN A HORIZONTAL SCROLL -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900 flex items-center gap-2">
            <span>🔥 Fast Selling Plots</span>
            <span class="bg-red-100 text-red-600 text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">High Demand</span>
          </h2>
          <p class="text-xs text-slate-500">Handpicked vertical plot cards available for immediate possession</p>
        </div>
        <div class="flex items-center gap-1">
          <span class="text-xs font-semibold text-slate-400">Scroll</span>
          <Icon icon="lucide:arrow-right" class="w-4 h-4 text-slate-400" />
        </div>
      </div>

      <!-- Horizontal Scrollable Container for Portrait Cards -->
      <div class="flex gap-4 overflow-x-auto no-scrollbar pb-4 pt-1 snap-x snap-mandatory">
        <div 
          v-for="item in portraitPlots" 
          :key="item.id"
          class="flex-shrink-0 w-60 sm:w-64 bg-white rounded-2xl border border-slate-200/80 overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 snap-start flex flex-col group cursor-pointer">
          
          <!-- Portrait Image Frame -->
          <div class="relative h-64 w-full bg-slate-100 overflow-hidden shrink-0">
            <img :src="item.image" :alt="item.title" class="w-full h-full object-cover group-hover:scale-105 transition duration-500" />
            <div class="absolute inset-0 bg-gradient-to-t from-slate-950/80 via-transparent to-transparent"></div>
            
            <span class="absolute top-3 left-3 bg-emerald-600 text-white text-[10px] font-extrabold px-2 py-0.5 rounded shadow">
              {{ item.tag }}
            </span>

            <button class="absolute top-3 right-3 w-7 h-7 rounded-full bg-white/80 backdrop-blur-md flex items-center justify-center text-slate-700 hover:text-red-500 transition">
              <Icon icon="lucide:heart" class="w-3.5 h-3.5" />
            </button>

            <!-- Portrait Bottom Overlay Info -->
            <div class="absolute bottom-3 left-3 right-3 text-white">
              <div class="flex items-baseline justify-between mb-0.5">
                <span class="text-lg font-black leading-none">{{ item.price }}</span>
                <span class="text-[10px] text-emerald-300 font-semibold">{{ item.pricePerSqFt }}</span>
              </div>
              <p class="text-[11px] text-slate-300 font-medium truncate">{{ item.dimensions }}</p>
            </div>
          </div>

          <!-- Portrait Content Bottom Card -->
          <div class="p-3 flex-1 flex flex-col justify-between bg-white">
            <div>
              <h3 class="text-xs font-bold text-slate-800 line-clamp-2 leading-snug mb-1.5 group-hover:text-emerald-600 transition">
                {{ item.title }}
              </h3>
              <p class="text-[11px] text-slate-500 flex items-center gap-1">
                <Icon icon="lucide:map-pin" class="w-3 h-3 text-emerald-600 shrink-0" />
                <span class="truncate">{{ item.locality }}</span>
              </p>
            </div>

            <button class="mt-3 w-full bg-slate-900 group-hover:bg-emerald-600 text-white text-[11px] font-bold py-2 rounded-xl transition flex items-center justify-center gap-1">
              <span>View Details</span>
              <Icon icon="lucide:chevron-right" class="w-3.5 h-3.5" />
            </button>
          </div>

        </div>
      </div>
    </section>

    <!-- 6. MIXED BENTO-BOX CATEGORY SECTION -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900">Explore Plot Collections</h2>
          <p class="text-xs text-slate-500">Discover land opportunities structured by investment intent</p>
        </div>
      </div>

      <!-- Bento Grid Box -->
      <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-3 gap-3 auto-rows-[160px]">
        <div 
          v-for="bento in bentoCategories" 
          :key="bento.id"
          :class="[bento.span]"
          class="relative rounded-2xl overflow-hidden group cursor-pointer border border-slate-200/80 shadow-sm hover:shadow-lg transition">
          
          <!-- Background Image & Gradient -->
          <img :src="bento.image" :alt="bento.title" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition duration-700" />
          <div :class="['absolute inset-0 bg-gradient-to-t', bento.accentColor]"></div>

          <!-- Content Overlay -->
          <div class="absolute inset-0 p-4 sm:p-5 flex flex-col justify-between text-white z-10">
            <div class="flex items-center justify-between">
              <span class="bg-white/20 backdrop-blur-md text-[10px] font-extrabold px-2.5 py-1 rounded-full uppercase tracking-wider flex items-center gap-1.5 border border-white/20">
                <Icon :icon="bento.icon" class="w-3.5 h-3.5 text-emerald-300" />
                {{ bento.count }}
              </span>
              <div class="w-7 h-7 rounded-full bg-white/10 backdrop-blur-md flex items-center justify-center group-hover:bg-white group-hover:text-slate-900 transition">
                <Icon icon="lucide:arrow-up-right" class="w-4 h-4" />
              </div>
            </div>

            <div>
              <h3 class="text-base sm:text-xl font-black leading-tight mb-1">{{ bento.title }}</h3>
              <p class="text-xs text-slate-300 font-medium line-clamp-1">{{ bento.subtitle }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 7. PROMOTIONAL / SELLER CTA BANNER CARD -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-700 text-white rounded-2xl p-4 sm:p-6 shadow-md relative overflow-hidden flex flex-col sm:flex-row items-center justify-between gap-4">
        <div class="absolute -right-10 -bottom-10 opacity-10 pointer-events-none">
          <Icon icon="lucide:building-2" class="w-64 h-64 text-white" />
        </div>

        <div class="relative z-10 text-center sm:text-left">
          <div class="inline-flex items-center gap-1 bg-white/20 text-white text-[10px] font-bold px-2.5 py-0.5 rounded-full mb-2 backdrop-blur-sm">
            <Icon icon="lucide:sparkles" class="w-3 h-3 text-yellow-300" />
            <span>LIMITED TIME PROMO</span>
          </div>
          <h3 class="text-base sm:text-xl font-extrabold leading-snug">
            Are You a Land Owner or Developer?
          </h3>
          <p class="text-xs text-emerald-100 mt-1 max-w-lg">
            Post your plot for <strong>100% Free</strong>. Get genuine buyer enquiries directly on WhatsApp with verified title checks.
          </p>
        </div>

        <div class="relative z-10 shrink-0 w-full sm:w-auto">
          <Link 
            href="/post-plot" 
            class="w-full sm:w-auto inline-flex items-center justify-center gap-2 bg-white text-emerald-800 hover:bg-slate-100 font-extrabold text-xs px-5 py-3 rounded-xl shadow-md transition text-center">
            <Icon icon="lucide:plus-circle" class="w-4 h-4 text-emerald-600" />
            Post Property for Free
          </Link>
        </div>
      </div>
    </section>

    <!-- 8. HORIZONTAL CARDS SECTION: NEW LAYOUT LAUNCHES -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900">New Layout Launches</h2>
          <p class="text-xs text-slate-500">Newly approved plotted developments in {{ currentCity }}</p>
        </div>
        <Link href="/new-launches" class="text-xs font-bold text-emerald-600 hover:underline">View All &rarr;</Link>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div 
          v-for="launch in newLaunches" 
          :key="launch.id"
          class="bg-white rounded-2xl border border-slate-200/80 overflow-hidden shadow-sm hover:shadow-md transition flex flex-col sm:flex-row">
          
          <div class="relative sm:w-2/5 h-40 sm:h-auto bg-slate-100 shrink-0">
            <img :src="launch.image" :alt="launch.name" class="w-full h-full object-cover" />
            <span class="absolute top-2 left-2 bg-amber-500 text-white text-[10px] font-bold px-2 py-0.5 rounded shadow">
              {{ launch.tag }}
            </span>
          </div>

          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <span class="text-[10px] font-semibold text-slate-400 uppercase tracking-wide">{{ launch.developer }}</span>
              <h3 class="text-sm font-bold text-slate-900 mb-1">{{ launch.name }}</h3>
              <p class="text-xs text-slate-500 flex items-center gap-1 mb-2">
                <Icon icon="lucide:map-pin" class="w-3.5 h-3.5 text-slate-400 shrink-0" />
                {{ launch.locality }}
              </p>

              <div class="flex items-center gap-2 mb-3">
                <span class="text-xs font-bold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-100">
                  {{ launch.approval }}
                </span>
                <span class="text-xs text-slate-500">{{ launch.totalUnits }}</span>
              </div>
            </div>

            <div class="flex items-center justify-between pt-2 border-t border-slate-100">
              <div>
                <span class="text-[10px] text-slate-400 block">Starting From</span>
                <span class="text-sm font-black text-slate-900">{{ launch.priceStarting }}</span>
              </div>
              <button class="text-xs font-bold px-3 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg transition">
                Enquire Now
              </button>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- 9. VERTICAL CARDS SECTION: HANDPICKED FEATURED PLOTS -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900">Handpicked Verified Plots</h2>
          <p class="text-xs text-slate-500">Curated land options with physical verification</p>
        </div>
        <Link href="/plots" class="text-xs font-bold text-emerald-600 hover:underline">View All &rarr;</Link>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <div 
          v-for="plot in featuredPlots" 
          :key="plot.id"
          class="bg-white rounded-2xl overflow-hidden border border-slate-200/80 shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col group">
          
          <div class="relative h-48 bg-slate-100 overflow-hidden">
            <img 
              :src="plot.image" 
              :alt="plot.title" 
              class="w-full h-full object-cover group-hover:scale-105 transition duration-500"
            />
            <div class="absolute top-3 left-3 flex flex-wrap gap-1.5">
              <span v-if="plot.isVerified" class="bg-emerald-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-md shadow flex items-center gap-1">
                <Icon icon="lucide:check-circle" class="w-3 h-3" /> Title Verified
              </span>
              <span class="bg-slate-900/80 backdrop-blur-md text-white text-[10px] font-medium px-2 py-0.5 rounded-md">
                {{ plot.sellerType }}
              </span>
            </div>
            
            <button class="absolute top-3 right-3 w-8 h-8 rounded-full bg-white/90 backdrop-blur-sm flex items-center justify-center text-slate-600 hover:text-red-500 shadow">
              <Icon icon="lucide:heart" class="w-4 h-4" />
            </button>

            <div class="absolute bottom-2 left-3 right-3 flex items-center justify-between text-white text-[11px] font-semibold bg-slate-900/60 backdrop-blur-md px-2.5 py-1 rounded-lg">
              <span>{{ plot.areaSqFt }}</span>
              <span>•</span>
              <span>{{ plot.dimensions }}</span>
              <span>•</span>
              <span>{{ plot.facing }}</span>
            </div>
          </div>

          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <div class="flex items-baseline justify-between mb-1">
                <span class="text-lg font-black text-slate-900">{{ plot.priceDisplay }}</span>
                <span class="text-xs font-semibold text-slate-500">{{ plot.pricePerSqFt }}</span>
              </div>
              
              <h3 class="text-sm font-bold text-slate-800 line-clamp-1 mb-1">{{ plot.title }}</h3>
              <p class="text-xs text-slate-500 flex items-center gap-1 mb-3">
                <Icon icon="lucide:map-pin" class="w-3.5 h-3.5 text-slate-400 shrink-0" />
                {{ plot.locality }}
              </p>

              <div class="flex flex-wrap gap-1 mb-4">
                <span 
                  v-for="approval in plot.approvals" 
                  :key="approval" 
                  class="text-[10px] font-bold bg-blue-50 text-blue-700 px-2 py-0.5 rounded border border-blue-100">
                  {{ approval }}
                </span>
              </div>
            </div>

            <div class="grid grid-cols-2 gap-2 pt-2 border-t border-slate-100">
              <button class="w-full text-xs font-bold py-2 px-3 text-slate-700 bg-slate-100 hover:bg-slate-200 rounded-xl transition text-center flex items-center justify-center gap-1">
                <Icon icon="lucide:file-text" class="w-3.5 h-3.5 text-slate-500" />
                Layout Plan
              </button>
              <button class="w-full text-xs font-bold py-2 px-3 text-white bg-emerald-600 hover:bg-emerald-700 rounded-xl shadow-sm transition text-center flex items-center justify-center gap-1">
                <Icon icon="lucide:phone-call" class="w-3.5 h-3.5" />
                Contact
              </button>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- 10. METRIC CARDS: HIGH INVESTMENT LOCALITIES -->
    <section class="max-w-7xl mx-auto px-4 mt-10">
      <div class="bg-gradient-to-r from-emerald-900 to-slate-900 text-white rounded-2xl p-5 sm:p-6 shadow-md">
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-4">
          <div>
            <h2 class="text-base sm:text-lg font-bold">Trending High-Growth Plot Corridors</h2>
            <p class="text-xs text-slate-300">Based on land appreciation data in {{ currentCity }}</p>
          </div>
          <span class="text-[11px] bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full border border-emerald-500/30 font-semibold w-max flex items-center gap-1">
            <Icon icon="lucide:trending-up" class="w-3.5 h-3.5 text-emerald-400" />
            Up to 18% Annual Appreciation
          </span>
        </div>

        <div class="grid grid-cols-2 sm:grid-cols-4 gap-3">
          <div 
            v-for="loc in popularLocalities" 
            :key="loc.name"
            class="bg-white/10 backdrop-blur-md border border-white/10 rounded-xl p-3 hover:bg-white/15 transition">
            <h4 class="text-xs font-bold text-white mb-0.5">{{ loc.name }}</h4>
            <p class="text-[11px] text-emerald-300 font-semibold">{{ loc.avgPrice }}</p>
            <span class="text-[10px] text-slate-400 block mt-1">Growth: <strong class="text-emerald-400">{{ loc.growth }}</strong></span>
          </div>
        </div>
      </div>
    </section>

    <!-- 11. VALUE PROP / TRUST FEATURE CARDS -->
    <section class="max-w-7xl mx-auto px-4 mt-10 mb-8">
      <h2 class="text-center text-lg font-extrabold text-slate-900 mb-6">Why Plot Buyers Choose Infinity Plots</h2>
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">
            <Icon icon="lucide:shield-check" class="w-5 h-5" />
          </div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Encumbrance & Title Check</h3>
          <p class="text-[11px] text-slate-500">Every listed plot undergoes legal document verification before going live.</p>
        </div>

        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">
            <Icon icon="lucide:ruler" class="w-5 h-5" />
          </div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Exact Plot Maps & Facing</h3>
          <p class="text-[11px] text-slate-500">Get boundary markings, street width, and exact plot dimensions transparently.</p>
        </div>

        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">
            <Icon icon="lucide:handshake" class="w-5 h-5" />
          </div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Direct Owner Communication</h3>
          <p class="text-[11px] text-slate-500">Zero middleman commission. Connect directly with owners and layout developers.</p>
        </div>
      </div>
    </section>

    <!-- 12. MOBILE BOTTOM NAVIGATION BAR -->
    <div class="md:hidden fixed bottom-0 left-0 right-0 bg-white border-t border-slate-200 px-6 py-2 flex items-center justify-between z-50 shadow-lg">
      <Link href="/" class="flex flex-col items-center gap-0.5 text-emerald-600">
        <Icon icon="lucide:home" class="w-5 h-5" />
        <span class="text-[10px] font-bold">Home</span>
      </Link>
      <Link href="/search" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:search" class="w-5 h-5" />
        <span class="text-[10px] font-semibold">Search</span>
      </Link>
      <Link href="/post-plot" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <div class="w-7 h-7 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm -mt-3 shadow-md">
          <Icon icon="lucide:plus" class="w-4 h-4" />
        </div>
        <span class="text-[10px] font-semibold">Sell Plot</span>
      </Link>
      <Link href="/shortlists" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:heart" class="w-5 h-5" />
        <span class="text-[10px] font-semibold">Saved</span>
      </Link>
      <Link href="/menu" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:menu" class="w-5 h-5" />
        <span class="text-[10px] font-semibold">Menu</span>
      </Link>
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