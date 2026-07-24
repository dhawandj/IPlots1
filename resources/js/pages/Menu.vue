<script setup>
import { ref } from 'vue'
import { Link, Head } from '@inertiajs/vue3'
import { Icon } from '@iconify/vue'

// --- USER STATE (Mock Data) ---
const user = ref({
  name: 'Dhawan Reddy',
  phone: '+91 98765 43210',
  email: 'dhawan@example.com',
  isVerified: true,
  avatar: null
})

// --- QUICK STATS ---
const quickStats = [
  { label: 'Saved Plots', value: '12', icon: 'lucide:heart', route: '/shortlists', color: 'text-rose-500 bg-rose-50' },
  { label: 'My Listings', value: '3', icon: 'lucide:map-pin', route: '/my-plots', color: 'text-emerald-600 bg-emerald-50' },
  { label: 'Inquiries', value: '8', icon: 'lucide:message-square', route: '/inquiries', color: 'text-blue-600 bg-blue-50' }
]

// --- REDESIGNED CATEGORIES STRUCTURE (99acres-Style) ---
const categoryGroups = [
  {
    title: 'Buy Property',
    badge: 'Popular',
    badgeColor: 'bg-emerald-100 text-emerald-700',
    icon: 'lucide:home',
    items: [
      { name: 'Residential Plots & Land', count: '3,200+', route: '/search?intent=buy&type=plot' },
      { name: 'Apartments & Flats', count: '5,100+', route: '/search?intent=buy&type=apartment' },
      { name: 'Independent Houses & Villas', count: '1,400+', route: '/search?intent=buy&type=villa' },
      { name: 'Gated Layouts & Townships', count: '890+', route: '/search?intent=buy&type=gated' }
    ]
  },
  {
    title: 'Rent & Lease',
    badge: 'High Demand',
    badgeColor: 'bg-blue-100 text-blue-700',
    icon: 'lucide:key-round',
    items: [
      { name: 'Rental Apartments', count: '4,100+', route: '/search?intent=rent&type=apartment' },
      { name: 'Independent Houses for Rent', count: '920+', route: '/search?intent=rent&type=house' },
      { name: 'Gated Community Homes', count: '650+', route: '/search?intent=rent&type=gated' }
    ]
  },
  {
    title: 'PG & Co-Living',
    badge: 'Students / Pros',
    badgeColor: 'bg-purple-100 text-purple-700',
    icon: 'lucide:bed',
    items: [
      { name: 'PG for Men', count: '1,200+', route: '/search?type=pg&gender=men' },
      { name: 'PG for Women', count: '1,100+', route: '/search?type=pg&gender=women' },
      { name: 'Unisex / Co-living Spaces', count: '450+', route: '/search?type=coliving' }
    ]
  },
  {
    title: 'Commercial Real Estate',
    badge: 'Investment',
    badgeColor: 'bg-amber-100 text-amber-800',
    icon: 'lucide:building-2',
    items: [
      { name: 'Commercial Land & Plots', count: '620+', route: '/search?type=commercial-land' },
      { name: 'Office Spaces (Buy/Lease)', count: '1,800+', route: '/search?type=office' },
      { name: 'Shops & Retail Stores', count: '950+', route: '/search?type=retail' },
      { name: 'Industrial Lands & Warehouses', count: '310+', route: '/search?type=warehouse' }
    ]
  },
  {
    title: 'Agricultural & Farmland',
    badge: 'Verified',
    badgeColor: 'bg-emerald-100 text-emerald-800',
    icon: 'lucide:sprout',
    items: [
      { name: 'Managed Farmlands', count: '240+ acres', route: '/search?type=farmland' },
      { name: 'Agricultural Land', count: '510+ acres', route: '/search?type=agricultural' },
      { name: 'Corner & Vastu Compliant Plots', count: '780+', route: '/search?feature=vastu' }
    ]
  }
]

// --- ACCOUNT & MANAGEMENT MENU ---
const accountMenu = [
  { title: 'My Profile & Preferences', desc: 'Manage phone, email & notifications', icon: 'lucide:user-cog', route: '/profile' },
  { title: 'My Posted Listings', desc: 'Track views, leads & edit plot status', icon: 'lucide:layers', route: '/my-plots' },
  { title: 'Saved & Shortlisted Sites', desc: 'Quickly access saved land choices', icon: 'lucide:bookmark', route: '/shortlists' },
  { title: 'Recently Viewed', desc: 'Browse your recent searches', icon: 'lucide:history', route: '/history' }
]

// --- SUPPORT MENU ---
const supportMenu = [
  { title: 'Help Center & FAQ', icon: 'lucide:help-circle', route: '/help' },
  { title: 'Contact Legal Expert', icon: 'lucide:scale', route: '/legal-assistance' },
  { title: 'Report Fraud Listing', icon: 'lucide:alert-triangle', route: '/report' },
  { title: 'Talk to Support', icon: 'lucide:headphones', route: '/support' }
]

// --- LEGAL POLICIES ---
const legalPolicies = [
  { title: 'Terms of Service', route: '/terms' },
  { title: 'Privacy Policy', route: '/privacy' },
  { title: 'Verification Guidelines', route: '/guidelines' },
  { title: 'Refund Policy', route: '/refund-policy' }
]
</script>

<template>
  <Head title="Menu Directory" />

  <div class="min-h-screen bg-slate-50 text-slate-800 pb-24 md:pb-12 font-sans antialiased">
    
    <!-- 1. STICKY TOP HEADER -->
    <header class="sticky top-0 z-40 bg-white/90 backdrop-blur-md border-b border-slate-200/80 shadow-2xs">
      <div class="max-w-4xl mx-auto px-4 h-14 flex items-center justify-between">
        <div class="flex items-center gap-2">
          <div class="w-7 h-7 rounded-xl bg-emerald-600 flex items-center justify-center text-white font-black text-sm shadow-xs">
            ∞
          </div>
          <span class="text-base font-extrabold text-slate-900 tracking-tight">Explore Directory</span>
        </div>

        <Link href="/post-plot" class="flex items-center gap-1.5 bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold px-3.5 py-1.5 rounded-full shadow-xs transition">
          <Icon icon="lucide:plus" class="w-3.5 h-3.5" />
          <span>Post Listing</span>
        </Link>
      </div>
    </header>

    <!-- MAIN MENU CONTENT CONTAINER -->
    <main class="max-w-4xl mx-auto px-4 pt-5 space-y-6">

      <!-- 2. USER PROFILE SUMMARY CARD -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-xs relative overflow-hidden">
        <div class="absolute -right-6 -bottom-6 w-28 h-28 bg-emerald-50 rounded-full blur-2xl pointer-events-none"></div>

        <div class="flex items-center justify-between gap-4 relative z-10">
          <div class="flex items-center gap-3.5">
            <div class="w-14 h-14 rounded-2xl bg-slate-900 text-white font-black text-xl flex items-center justify-center shadow-md shrink-0">
              <span v-if="!user.avatar">{{ user.name.split(' ').map(n => n[0]).join('') }}</span>
              <img v-else :src="user.avatar" :alt="user.name" class="w-full h-full object-cover rounded-2xl" />
            </div>

            <div>
              <div class="flex items-center gap-1.5">
                <h2 class="text-base font-extrabold text-slate-900 leading-tight">{{ user.name }}</h2>
                <Icon v-if="user.isVerified" icon="lucide:check-circle-2" class="w-4 h-4 text-emerald-500 fill-emerald-100" />
              </div>
              <p class="text-xs text-slate-500 font-medium">{{ user.phone }}</p>
              <span class="inline-block text-[10px] font-bold bg-emerald-50 text-emerald-700 px-2 py-0.5 rounded-md mt-1 border border-emerald-100">
                Verified Buyer & Owner
              </span>
            </div>
          </div>

          <Link href="/profile" class="w-9 h-9 rounded-full bg-slate-100 hover:bg-slate-200 flex items-center justify-center text-slate-600 transition shrink-0">
            <Icon icon="lucide:chevron-right" class="w-5 h-5" />
          </Link>
        </div>

        <!-- Quick Stats Strip -->
        <div class="grid grid-cols-3 gap-2.5 mt-5 pt-4 border-t border-slate-100">
          <Link 
            v-for="stat in quickStats" 
            :key="stat.label" 
            :href="stat.route"
            class="flex flex-col items-center justify-center p-2.5 rounded-2xl bg-slate-50 hover:bg-slate-100 transition text-center border border-slate-100">
            <div :class="[stat.color, 'w-7 h-7 rounded-xl flex items-center justify-center mb-1']">
              <Icon :icon="stat.icon" class="w-4 h-4" />
            </div>
            <span class="text-sm font-black text-slate-900 leading-none mb-0.5">{{ stat.value }}</span>
            <span class="text-[10px] font-bold text-slate-500">{{ stat.label }}</span>
          </Link>
        </div>
      </section>

      <!-- 3. REDESIGNED PROPERTY CATEGORIES DIRECTORY (99acres Style Grid) -->
      <section class="space-y-4">
        <div class="flex items-center justify-between px-1">
          <div>
            <h3 class="text-sm font-black text-slate-900 uppercase tracking-wide">Property Categories</h3>
            <p class="text-[11px] text-slate-500 font-medium">Browse residential, commercial & rental listings</p>
          </div>
          <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2.5 py-1 rounded-full border border-emerald-100">
            All Listings
          </span>
        </div>

        <!-- Category Group Cards Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div 
            v-for="group in categoryGroups" 
            :key="group.title"
            class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-xs flex flex-col justify-between hover:border-emerald-200 transition">
            
            <div>
              <!-- Header Section of Each Category Group -->
              <div class="flex items-center justify-between border-b border-slate-100 pb-3 mb-3">
                <div class="flex items-center gap-2.5">
                  <div class="w-8 h-8 rounded-xl bg-slate-100 text-slate-800 flex items-center justify-center">
                    <Icon :icon="group.icon" class="w-4 h-4 text-emerald-600" />
                  </div>
                  <h4 class="text-sm font-extrabold text-slate-900">{{ group.title }}</h4>
                </div>
                <span :class="[group.badgeColor, 'text-[10px] font-bold px-2 py-0.5 rounded-md']">
                  {{ group.badge }}
                </span>
              </div>

              <!-- List Items -->
              <ul class="space-y-1">
                <li v-for="item in group.items" :key="item.name">
                  <Link 
                    :href="item.route" 
                    class="flex items-center justify-between py-2 px-2.5 rounded-xl hover:bg-slate-50 text-xs font-semibold text-slate-700 hover:text-emerald-600 transition group">
                    <div class="flex items-center gap-2">
                      <span class="w-1.5 h-1.5 rounded-full bg-slate-300 group-hover:bg-emerald-500 transition"></span>
                      <span>{{ item.name }}</span>
                    </div>
                    <div class="flex items-center gap-1.5">
                      <span class="text-[10px] font-medium text-slate-400 group-hover:text-emerald-600">{{ item.count }}</span>
                      <Icon icon="lucide:chevron-right" class="w-3.5 h-3.5 text-slate-300 group-hover:text-emerald-600 group-hover:translate-x-0.5 transition" />
                    </div>
                  </Link>
                </li>
              </ul>
            </div>

          </div>
        </div>
      </section>

      <!-- 4. ACCOUNT & LISTING MANAGEMENT -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-3">Account & Management</h3>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2">
          <Link 
            v-for="item in accountMenu" 
            :key="item.title"
            :href="item.route"
            class="flex items-start gap-3 p-3 rounded-2xl hover:bg-slate-50 border border-transparent hover:border-slate-100 transition group">
            <div class="w-9 h-9 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center shrink-0 mt-0.5">
              <Icon :icon="item.icon" class="w-4 h-4" />
            </div>
            <div>
              <h4 class="text-xs font-bold text-slate-900 group-hover:text-emerald-600 transition">{{ item.title }}</h4>
              <p class="text-[11px] text-slate-500 font-medium leading-snug">{{ item.desc }}</p>
            </div>
          </Link>
        </div>
      </section>

      <!-- 5. SUPPORT & HELP DESK -->
      <section class="bg-white rounded-3xl p-5 border border-slate-200/80 shadow-xs">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-3">Help & Support</h3>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2">
          <Link 
            v-for="help in supportMenu" 
            :key="help.title"
            :href="help.route"
            class="flex items-center justify-between p-3 rounded-2xl hover:bg-slate-50 border border-transparent hover:border-slate-100 transition group">
            <div class="flex items-center gap-3">
              <Icon :icon="help.icon" class="w-4 h-4 text-slate-400 group-hover:text-emerald-600 transition" />
              <span class="text-xs font-bold text-slate-800 group-hover:text-emerald-600 transition">{{ help.title }}</span>
            </div>
            <Icon icon="lucide:arrow-up-right" class="w-3.5 h-3.5 text-slate-300 group-hover:text-slate-600 transition" />
          </Link>
        </div>
      </section>

      <!-- 6. POLICIES, LEGAL & APP FOOTER -->
      <section class="bg-slate-100/80 rounded-3xl p-5 border border-slate-200/60">
        <h3 class="text-xs font-extrabold text-slate-400 uppercase tracking-wider mb-3">Policies & Legal Terms</h3>

        <div class="flex flex-wrap gap-x-4 gap-y-2 mb-4">
          <Link 
            v-for="policy in legalPolicies" 
            :key="policy.title"
            :href="policy.route"
            class="text-xs font-semibold text-slate-600 hover:text-emerald-600 transition">
            {{ policy.title }}
          </Link>
        </div>

        <div class="pt-3 border-t border-slate-200/80 flex items-center justify-between text-[11px] text-slate-400 font-medium">
          <span>App Version 2.4.0 (Production)</span>
          <button class="text-rose-600 font-bold hover:underline flex items-center gap-1 cursor-pointer">
            <Icon icon="lucide:log-out" class="w-3.5 h-3.5" />
            <span>Sign Out</span>
          </button>
        </div>
      </section>

    </main>

    <!-- 7. MOBILE BOTTOM NAVIGATION BAR -->
    <div class="md:hidden fixed bottom-0 left-0 right-0 bg-white/95 backdrop-blur-md border-t border-slate-200 px-6 py-2 flex items-center justify-between z-50 shadow-lg">
      <Link href="/" class="flex flex-col items-center gap-0.5 text-slate-400 hover:text-slate-700">
        <Icon icon="lucide:home" class="w-5 h-5" />
        <span class="text-[10px] font-semibold">Home</span>
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

      <Link href="/menu" class="flex flex-col items-center gap-0.5 text-emerald-600 font-bold">
        <Icon icon="lucide:menu" class="w-5 h-5" />
        <span class="text-[10px]">Menu</span>
      </Link>
    </div>

  </div>
</template>