import { gql } from "@apollo/client";
export const CREATE_SONG = gql`
  query createSong($songsSearch: SongsSearchParams, $page: Int, $first: Int) {
    songs(songsSearch: $songsSearch, page: $page, first: $first) {
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
