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
                'message' => 'Invalid file upload. Both PDF and MIDI are required.',
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
        if ($pdf->getClientOriginalExtension() !== 'pdf') {
            return [
                'message' => 'The file must be a PDF.',
                'upload' => null,
            ];
        }

        if ($midi->getClientOriginalExtension() !== 'mid') {
            return [
                'message' => 'The midi must be a MIDI file.',
                'upload' => null,
            ];
        }

        // *Extract the Original File Names and Format Them*
        $fileOriginalName = pathinfo($pdf->getClientOriginalName(), PATHINFO_FILENAME);
        $audioOriginalName = pathinfo($midi->getClientOriginalName(), PATHINFO_FILENAME);

        // *Slugify the filenames to remove special characters*
        $fileName = Str::slug($fileOriginalName) . "-" . time() . ".pdf";
        $audioName = Str::slug($audioOriginalName) . "-" . time() . ".mid";

        // *Store the files with formatted names*
        $filePath = $pdf->storeAs('uploads/pdf', $fileName, 'public');
        $audioPath = $midi->storeAs('uploads/midi', $audioName, 'public');

        // *Save to database with readable filenames*
        $upload = Song::create([
            'title' => $title,
            'composer' => $composer,
            'ytlink' => $ytlink,
            'lyrics' => $lyrics,
            'subcategory_id' => $subcategoryId,
            'user_id' => $userId,
            'pdf' => $filePath, // Store the path to the PDF file
            'midi' => $audioPath, // Store the path to the MIDI file
            'message' => 'File uploaded successfully',
        ]);

        return [
            'message' => 'Files uploaded successfully',
            'upload' => $upload,
        ];
    }
}