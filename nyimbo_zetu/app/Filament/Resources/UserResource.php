<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    public static function form(Form $form): Form
    {
        return $form->schema([
            TextInput::make('email')
                ->label('Email Address')
                ->email()
                ->required()
                ->unique(ignoreRecord: true),

            FileUpload::make('image')
                ->label('Profile Image')
                ->image()
                ->directory('User_images')
                ->visibility('public'),
            TextInput::make('first_name')
                ->label('First Name')
                ->maxLength(255),
            TextInput::make('last_name')
                ->label('Last Name')
                ->maxLength(255),
            TextInput::make('phone_number')
                ->label('Phone Number')
                ->maxLength(20),
            TextInput::make('address')
                ->label('Address')
                ->maxLength(255),
            TextInput::make('password')
                ->label('Password')
                ->password()
                ->required(fn(string $context): bool => $context === 'create')
                ->minLength(8)
                ->maxLength(255)
                ->dehydrateStateUsing(fn($state) => filled($state) ? bcrypt($state) : null) // hashes manually
                ->dehydrated(fn($state) => filled($state)) // ensures it only saves if filled
                ->visible(fn(string $context): bool => $context !== 'view'),



        ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([
            ImageColumn::make('image')->label('Profile'),
            TextColumn::make('email')->label('Email')->searchable()->sortable(),
        ])
            ->filters([])
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
