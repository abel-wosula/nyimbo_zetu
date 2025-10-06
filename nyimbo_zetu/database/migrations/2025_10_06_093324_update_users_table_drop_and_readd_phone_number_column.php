<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        // First, drop the column if it exists
        if (Schema::hasColumn('users', 'phone_number')) {
            Schema::table('users', function (Blueprint $table) {
                $table->dropUnique(['phone_number']); // if it had a unique index
                $table->dropColumn('phone_number');
            });
        }

        // Then, re-add the column with the new constraint
        Schema::table('users', function (Blueprint $table) {
            $table->string('phone_number')->nullable()->after('last_name');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('users', 'phone_number')) {
                $table->dropColumn('phone_number');
            }
        });
    }
};
