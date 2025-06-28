import { gql } from "@apollo/client";
export const CREATE_SONG = gql`
  query createSong(
    $songsSearch: SongsSearchParams
    $page: Int
    $first: Int
    $user_id: ID
  ) {
    songs(
      songsSearch: $songsSearch
      page: $page
      first: $first
      user_id: $user_id
    ) {
      data {
        id
        artists
        title
        lyrics
        composer
        midi
        pdf
        ytlink
        subcategory_id
        user_id
      }
      paginatorInfo {
        total
        currentPage
        hasMorePages
        lastPage
      }
    }
  }
`;
