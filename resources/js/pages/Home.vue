<script setup>
import { ref, computed } from 'vue'
import { Link, Head } from '@inertiajs/vue3'

// --- MOCK DATA ---
const currentCity = ref('Bengaluru')
const cities = ['Bengaluru', 'Hyderabad', 'Chennai', 'Pune', 'Mumbai']

const activeTab = ref('buy') // 'buy', 'invest', 'gated'

const searchQuery = ref({
  locality: '',
  plotType: 'all',
  maxBudget: ''
})

const plotCategories = [
  { id: 'gated', name: 'Gated Communities', icon: '🏰', count: '1,240+' },
  { id: 'dtcp', name: 'DTCP / RERA Approved', icon: '🛡️', count: '3,800+' },
  { id: 'agricultural', name: 'Farmland & Agri', icon: '🌾', count: '950+' },
  { id: 'commercial', name: 'Commercial Land', icon: '🏢', count: '620+' },
]

const popularLocalities = [
  { name: 'Devanahalli', city: 'Bengaluru', avgPrice: '₹3,200 / sq.ft', growth: '+14% YoY' },
  { name: 'Sarjapur Road', city: 'Bengaluru', avgPrice: '₹4,500 / sq.ft', growth: '+18% YoY' },
  { name: 'Yelahanka', city: 'Bengaluru', avgPrice: '₹5,100 / sq.ft', growth: '+12% YoY' },
  { name: 'Hosur Road', city: 'Bengaluru', avgPrice: '₹2,800 / sq.ft', growth: '+15% YoY' },
]

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
    isVerified: true,
    isFeatured: true
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
    isVerified: true,
    isFeatured: true
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
    isVerified: true,
    isFeatured: false
  }
])

const handleSearch = () => {
  // Submit search via Inertia router
  console.log('Searching plots:', { city: currentCity.value, ...searchQuery.value })
}
</script>

<template>
  <Head title="Infinity Plots - Verified Land & Plots for Buy & Investment" />

  <div class="min-h-screen bg-slate-50 text-slate-800 pb-20 md:pb-10 font-sans">
    
    <!-- TOP HEADER / NAVBAR -->
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
          <svg class="w-3.5 h-3.5 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
          <select v-model="currentCity" class="bg-transparent focus:outline-none cursor-pointer pr-1">
            <option v-for="city in cities" :key="city" :value="city">{{ city }}</option>
          </select>
        </div>

        <!-- Desktop Navigation Actions -->
        <div class="hidden md:flex items-center gap-4">
          <Link href="/post-plot" class="text-xs font-semibold px-4 py-2 text-emerald-700 bg-emerald-50 rounded-lg border border-emerald-200 hover:bg-emerald-100 transition">
            + Post Plot <span class="bg-emerald-600 text-white text-[10px] px-1.5 py-0.5 rounded ml-1">FREE</span>
          </Link>
          <Link href="/login" class="text-xs font-semibold px-4 py-2 text-slate-700 hover:text-emerald-600">
            Log In / Register
          </Link>
        </div>
      </div>
    </header>

    <!-- HERO SECTION & SEARCH -->
    <section class="bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900 text-white pt-8 pb-14 px-4 relative overflow-hidden">
      <!-- Subtle background accent -->
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

        <!-- Search Card -->
        <div class="bg-white rounded-2xl p-3 sm:p-4 text-slate-800 shadow-xl border border-slate-100 text-left">
          
          <!-- Quick Tabs -->
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

          <!-- Input Fields -->
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

          <!-- Submit Search Button -->
          <button 
            @click="handleSearch"
            class="w-full mt-3 bg-emerald-600 hover:bg-emerald-700 active:scale-[0.99] text-white font-bold text-xs sm:text-sm py-3 rounded-xl shadow-lg shadow-emerald-600/30 flex items-center justify-center gap-2 transition">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
            Search Verified Plots
          </button>
        </div>

      </div>
    </section>

    <!-- QUICK CATEGORIES (HORIZONTAL SCROLL ON MOBILE) -->
    <section class="max-w-7xl mx-auto px-4 -mt-6 relative z-20">
      <div class="flex gap-3 overflow-x-auto no-scrollbar pb-2 pt-1">
        <div 
          v-for="cat in plotCategories" 
          :key="cat.id"
          class="flex-shrink-0 bg-white border border-slate-200/80 rounded-xl p-3 min-w-[150px] shadow-sm hover:shadow-md transition cursor-pointer flex items-center gap-3">
          <span class="text-2xl">{{ cat.icon }}</span>
          <div>
            <h4 class="text-xs font-bold text-slate-800 leading-snug">{{ cat.name }}</h4>
            <span class="text-[10px] text-slate-400 font-medium">{{ cat.count }} plots</span>
          </div>
        </div>
      </div>
    </section>

    <!-- FEATURED PLOTS LISTINGS -->
    <section class="max-w-7xl mx-auto px-4 mt-8">
      <div class="flex items-center justify-between mb-4">
        <div>
          <h2 class="text-lg font-extrabold text-slate-900">Handpicked Verified Plots</h2>
          <p class="text-xs text-slate-500">Curated land options with physical verification</p>
        </div>
        <Link href="/plots" class="text-xs font-bold text-emerald-600 hover:underline">View All &rarr;</Link>
      </div>

      <!-- Plot Cards Grid -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <div 
          v-for="plot in featuredPlots" 
          :key="plot.id"
          class="bg-white rounded-2xl overflow-hidden border border-slate-200/80 shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col group">
          
          <!-- Image Section -->
          <div class="relative h-48 bg-slate-100 overflow-hidden">
            <img 
              :src="plot.image" 
              :alt="plot.title" 
              class="w-full h-full object-cover group-hover:scale-105 transition duration-500"
            />
            <div class="absolute top-3 left-3 flex flex-wrap gap-1.5">
              <span v-if="plot.isVerified" class="bg-emerald-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-md shadow">
                ✓ Verified Title
              </span>
              <span class="bg-slate-900/80 backdrop-blur-md text-white text-[10px] font-medium px-2 py-0.5 rounded-md">
                {{ plot.sellerType }}
              </span>
            </div>
            
            <button class="absolute top-3 right-3 w-8 h-8 rounded-full bg-white/90 backdrop-blur-sm flex items-center justify-center text-slate-600 hover:text-red-500 shadow">
              <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg>
            </button>

            <div class="absolute bottom-2 left-3 right-3 flex items-center justify-between text-white text-[11px] font-semibold bg-slate-900/60 backdrop-blur-md px-2.5 py-1 rounded-lg">
              <span>{{ plot.areaSqFt }}</span>
              <span>•</span>
              <span>{{ plot.dimensions }}</span>
              <span>•</span>
              <span>{{ plot.facing }}</span>
            </div>
          </div>

          <!-- Plot Details -->
          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <div class="flex items-baseline justify-between mb-1">
                <span class="text-lg font-black text-slate-900">{{ plot.priceDisplay }}</span>
                <span class="text-xs font-semibold text-slate-500">{{ plot.pricePerSqFt }}</span>
              </div>
              
              <h3 class="text-sm font-bold text-slate-800 line-clamp-1 mb-1">{{ plot.title }}</h3>
              <p class="text-xs text-slate-500 flex items-center gap-1 mb-3">
                <svg class="w-3.5 h-3.5 text-slate-400 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/></svg>
                {{ plot.locality }}
              </p>

              <!-- Approval Tags -->
              <div class="flex flex-wrap gap-1 mb-4">
                <span 
                  v-for="approval in plot.approvals" 
                  :key="approval" 
                  class="text-[10px] font-bold bg-blue-50 text-blue-700 px-2 py-0.5 rounded border border-blue-100">
                  {{ approval }}
                </span>
              </div>
            </div>

            <!-- CTA Buttons -->
            <div class="grid grid-cols-2 gap-2 pt-2 border-t border-slate-100">
              <button class="w-full text-xs font-bold py-2 px-3 text-slate-700 bg-slate-100 hover:bg-slate-200 rounded-xl transition text-center">
                Get Layout Plan
              </button>
              <button class="w-full text-xs font-bold py-2 px-3 text-white bg-emerald-600 hover:bg-emerald-700 rounded-xl shadow-sm transition text-center">
                Contact Owner
              </button>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- HIGH INVESTMENT LOCALITIES -->
    <section class="max-w-7xl mx-auto px-4 mt-10">
      <div class="bg-gradient-to-r from-emerald-900 to-slate-900 text-white rounded-2xl p-5 sm:p-6 shadow-md">
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-4">
          <div>
            <h2 class="text-base sm:text-lg font-bold">Trending High-Growth Plot Corridors</h2>
            <p class="text-xs text-slate-300">Based on land appreciation data in {{ currentCity }}</p>
          </div>
          <span class="text-[11px] bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full border border-emerald-500/30 font-semibold w-max">
            🔥 Up to 18% Annual Appreciation
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

    <!-- WHY INFINITY PLOTS (TRUST FACTORS) -->
    <section class="max-w-7xl mx-auto px-4 mt-10 mb-8">
      <h2 class="text-center text-lg font-extrabold text-slate-900 mb-6">Why Plot Buyers Choose Infinity Plots</h2>
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">📄</div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Encumbrance & Title Check</h3>
          <p class="text-[11px] text-slate-500">Every listed plot undergoes legal document verification before going live.</p>
        </div>

        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">📐</div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Exact Plot Maps & Facing</h3>
          <p class="text-[11px] text-slate-500">Get boundary markings, street width, and exact plot dimensions transparently.</p>
        </div>

        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 text-center">
          <div class="w-10 h-10 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-2 text-lg font-bold">🤝</div>
          <h3 class="text-xs font-bold text-slate-800 mb-1">Direct Owner Communication</h3>
          <p class="text-[11px] text-slate-500">Zero middleman commission. Connect directly with owners and layout developers.</p>
        </div>
      </div>
    </section>

    <!-- MOBILE BOTTOM FIXED NAV BAR -->
    <div class="md:hidden fixed bottom-0 left-0 right-0 bg-white border-t border-slate-200 px-6 py-2 flex items-center justify-between z-50 shadow-lg">
      <Link href="/" class="flex flex-col items-center gap-0.5 text-emerald-600">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
        <span class="text-[10px] font-bold">Home</span>
      </Link>
      <Link href="/plots" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
        <span class="text-[10px] font-semibold">Explore</span>
      </Link>
      <Link href="/post-plot" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <div class="w-7 h-7 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm -mt-3 shadow-md">
          +
        </div>
        <span class="text-[10px] font-semibold">Sell Plot</span>
      </Link>
      <Link href="/shortlists" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg>
        <span class="text-[10px] font-semibold">Saved</span>
      </Link>
      <Link href="/login" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
        <span class="text-[10px] font-semibold">Account</span>
      </Link>
    </div>

  </div>
</template>

<style scoped>
/* Utility to hide scrollbars for horizontal category scroll */
.no-scrollbar::-webkit-scrollbar {
  display: none;
}
.no-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
</style>