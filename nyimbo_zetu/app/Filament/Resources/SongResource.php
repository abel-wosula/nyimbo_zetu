<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SongResource\Pages;
use App\Models\Song;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Support\Facades\Auth;

class SongResource extends Resource
{
    protected static ?string $model = Song::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')
                    ->label('Song Title')
                    ->required()
                    ->maxLength(255),

                TextInput::make('artists')
                    ->label('Artists/Choir')
                    ->required()
                    ->maxLength(255),

                TextInput::make('composer')
                    ->label('Composer')
                    ->required()
                    ->maxLength(255),

                TextInput::make('lyrics')
                    ->label('Lyrics')
                    ->required()
                    ->maxLength(65535),

                TextInput::make('ytlink')
                    ->label('YouTube Link')
                    ->maxLength(255),

                FileUpload::make('pdf')
                    ->label('PDF File')
                    ->disk('public') // ✅ make sure this matches config/filesystems.php
                    ->directory('uploads/pdf')
                    ->maxSize(10240)
                    ->acceptedFileTypes(['application/pdf'])
                    ->required()
                    ->helperText('Accepted format: PDF (.pdf)'),

                FileUpload::make('midi')
                    ->label('MIDI / MP3 / WAV File')
                    ->disk('public')
                    ->directory('uploads/midi')
                    ->maxSize(10240)
                    ->rules([
                        'mimes:mp3,mid,wav',
                    ])
                    ->helperText('Accepted formats: MP3, MIDI (.mid), WAV'),





                /*   Select::make('category_id')
                    ->label('Category')
                    ->relationship('category', 'name')
                    ->required()
                    ->searchable()
                    ->preload(), */

                Select::make('subcategory_id')
                    ->label('SubCategory')
                    ->relationship('subcategory', 'name')
                    ->required()
                    ->searchable()
                    ->preload(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')->label('Song Title')->sortable()->searchable(),
                TextColumn::make('artists')->label('Artists/Choir')->sortable()->searchable(),
                TextColumn::make('composer')->label('Composer')->sortable()->searchable(),
                TextColumn::make('subcategory.name')->label('SubCategory')->sortable()->searchable(),
                //TextColumn::make('category.name')->label('Category')->sortable()->searchable(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSongs::route('/'),
            'create' => Pages\CreateSong::route('/create'),
            'edit' => Pages\EditSong::route('/{record}/edit'),
        ];
    }

    /**
     * Automatically assign the logged-in user to the song.
     */
    public static function mutateFormDataBeforeCreate(array $data): array
    {
        $data['user_id'] = Auth::id();
        return $data;
    }

    /**
     * (Optional) Ensure user_id isn't changed during edit.
     */
    public static function mutateFormDataBeforeSave(array $data): array
    {
        $data['user_id'] = Auth::id();
        return $data;
    }
}
