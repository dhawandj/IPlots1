<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::inertia('/', 'Home')->name('home');
Route::inertia('/search', 'Search')->name('search');
Route::inertia('/menu', 'Menu')->name('menu');

Route::get('/plots/{id}', function ($id) {
    return Inertia::render('PlotDetail', [
        'id' => $id
    ]);
})->name('plots.show');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::inertia('dashboard', 'Dashboard')->name('dashboard');
});

require __DIR__.'/settings.php';
