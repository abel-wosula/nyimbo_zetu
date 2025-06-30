import gql from "graphql-tag";

export const UPLOAD_SONG = gql`
  mutation createSong($input: CreateSongInput!) {
    createSong(input: $input) {
      message
      upload {
        id
        title
        artists
        composer
        ytlink
        lyrics
        pdf
        midi
        subcategory_id
        user_id
      }
    }
  }
`;
