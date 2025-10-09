<?php

namespace App\Filament\Resources\SongResource\Pages;

use App\Filament\Resources\SongResource;
use Filament\Pages\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateSong extends CreateRecord
{
    protected static string $resource = SongResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Attach the currently logged-in user's ID before saving
        $data['user_id'] = Auth::id();
        return $data;
    }
}
