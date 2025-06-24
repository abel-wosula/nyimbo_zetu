<?php

namespace App\GraphQL\Mutations;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Models\Song;

class CreateSongMutation
{
    public function createSong($_, array $args)
    {
        // Validate file uploads
        if (
            empty($args['pdf']) || !$args['pdf'] instanceof UploadedFile ||
            empty($args['midi']) || !$args['midi'] instanceof UploadedFile
        ) {
            return [
                'message' => 'Invalid file upload. Both PDF and audio are required.',
                'upload' => null,
            ];
        }

        $pdf = $args['pdf'];
        $midi = $args['midi'];
        $title = $args['title'];
        $composer = $args['composer'] ?? null;
        $ytlink = $args['ytlink'] ?? null;
        $lyrics = $args['lyrics'] ?? null;
        $subcategoryId = $args['subcategory_id'] ?? null;
        $userId = $args['user_id'] ?? null;

        // Validate file types
        if (!in_array($pdf->getClientOriginalExtension(), ['pdf'])) {
            return [
                'message' => 'The file must be a PDF.',
                'upload' => null,
            ];
        }

        $allowedAudioExtensions = ['mp3', 'mid', 'wav'];
        $audioExtension = $midi->getClientOriginalExtension();

        if (!in_array($audioExtension, $allowedAudioExtensions)) {
            return [
                'message' => 'The audio must be a MP3, MIDI, or WAV file.',
                'upload' => null,
            ];
        }

        // Extract and slugify file names
        $fileOriginalName = pathinfo($pdf->getClientOriginalName(), PATHINFO_FILENAME);
        $audioOriginalName = pathinfo($midi->getClientOriginalName(), PATHINFO_FILENAME);

        $fileName = Str::slug($fileOriginalName) . "-" . time() . ".pdf";
        $audioName = Str::slug($audioOriginalName) . "-" . time() . "." . $audioExtension;

        // Store the files
        $filePath = $pdf->storeAs('uploads/pdf', $fileName, 'public');
        $audioPath = $midi->storeAs('uploads/midi', $audioName, 'public');

        // Save to DB
        $upload = Song::create([
            'title' => $title,
            'composer' => $composer,
            'ytlink' => $ytlink,
            'lyrics' => $lyrics,
            'subcategory_id' => $subcategoryId,
            'user_id' => $userId,
            'pdf' => "/storage/$filePath",
            'midi' => "/storage/$audioPath",
            'message' => 'File uploaded successfully',
        ]);

        return [
            'message' => 'Files uploaded successfully',
            'upload' => $upload,
        ];
    }
}
