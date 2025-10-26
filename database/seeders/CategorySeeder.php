<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            [
                'title' => 'Barber',
                'slug' => 'barber',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Beauticians',
                'slug' => 'beauticians',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Tutors',
                'slug' => 'tutors',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Mechanic',
                'slug' => 'mechanic',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Car Wash',
                'slug' => 'car-wash',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Home Cleaning',
                'slug' => 'home-cleaning',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Decor',
                'slug' => 'decor',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Event Planner',
                'slug' => 'event-planner',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Makeup Artist',
                'slug' => 'makeup-artist',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],[
                'title' => 'Designing',
                'slug' => 'designing',
                'image_url' => 'category/default.png',
                'status' => '1',
                'created_at' => Carbon::now(),
            ],
        ]);
    }
}
