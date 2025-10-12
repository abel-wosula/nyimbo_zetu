<?php

namespace App\GraphQL\Mutations;

use App\Models\Song;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CreateSongMutation
{
    public function createSong($_, array $args)
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
            'pdf' => 'required|file|mimes:pdf|max:10240', // 10MB limit
            'midi' => 'required|file|mimes:mp3,mid,wav|max:20480', // 20MB limit
        ]);

        if ($validator->fails()) {
            return [
                'message' => $validator->errors()->first(),
                'upload' => null,
            ];
        }

        // Access validated data
        $data = $validator->validated();

        /** @var UploadedFile $pdf */
        $pdf = $data['pdf'];
        /** @var UploadedFile $midi */
        $midi = $data['midi'];

        // Generate safe file names
        $pdfFileName = Str::slug(pathinfo($pdf->getClientOriginalName(), PATHINFO_FILENAME))
            . '-' . time() . '.pdf';
        $midiFileName = Str::slug(pathinfo($midi->getClientOriginalName(), PATHINFO_FILENAME))
            . '-' . time() . '.' . $midi->getClientOriginalExtension();

        // Store files in public storage
        $pdfPath = $pdf->storeAs('uploads/pdf', $pdfFileName, 'public');
        $midiPath = $midi->storeAs('uploads/midi', $midiFileName, 'public');

        // Save song to database
        $upload = Song::create([
            'artists' => $data['artists'],
            'title' => $data['title'],
            'composer' => $data['composer'] ?? null,
            'ytlink' => $data['ytlink'] ?? null,
            'lyrics' => $data['lyrics'] ?? null,
            'subcategory_id' => $data['subcategory_id'] ?? null,
            'user_id' => $data['user_id'] ?? null,
            'pdf' => $pdfPath,
            'midi' => $midiPath,
        ]);

        return [
            'message' => 'Files uploaded successfully!',
            'upload' => $upload,
        ];
    }
}
