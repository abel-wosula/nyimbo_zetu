<?php

namespace App\GraphQL\Mutations;

use App\Models\Song;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CreateSongMutation
{
    public function __invoke($_, array $args)
    {
        // Validate inputs
        $validator = Validator::make($args, [
            'artists' => 'required|string',
            'title' => 'required|string|max:255',
            'composer' => 'nullable|string|max:255',
            'ytlink' => 'nullable|string|max:255',
            'lyrics' => 'nullable|string',
            'subcategory_id' => 'nullable|integer',
            'user_id' => 'nullable|integer',
            'pdf' => 'required|file|mimes:pdf',
            'midi' => 'required|file|mimes:mp3,mid,wav',
        ]);

        if ($validator->fails()) {
            return [
                'message' => $validator->errors()->first(),
                'upload' => null,
            ];
        }

        /** @var UploadedFile $pdf */
        $pdf = $args['pdf'];
        /** @var UploadedFile $midi */
        $midi = $args['midi'];

        // Generate file names
        $fileName = Str::slug(pathinfo($pdf->getClientOriginalName(), PATHINFO_FILENAME)) . '-' . time() . '.pdf';
        $audioName = Str::slug(pathinfo($midi->getClientOriginalName(), PATHINFO_FILENAME)) . '-' . time() . '.' . $midi->getClientOriginalExtension();

        // Store files in public disk
        $filePath = $pdf->storeAs('uploads/pdf', $fileName, 'public');
        $audioPath = $midi->storeAs('uploads/midi', $audioName, 'public');

        // Save to DB
        $upload = Song::create([
            'artists' => $args['artists'],
            'title' => $args['title'],
            'composer' => $args['composer'] ?? null,
            'ytlink' => $args['ytlink'] ?? null,
            'lyrics' => $args['lyrics'] ?? null,
            'subcategory_id' => $args['subcategory_id'] ?? null,
            'user_id' => $args['user_id'] ?? null,
            'pdf' => $filePath,
            'midi' => $audioPath,
        ]);

        return [
            'message' => 'Files uploaded successfully!',
            'upload' => $upload,
        ];
    }
}
