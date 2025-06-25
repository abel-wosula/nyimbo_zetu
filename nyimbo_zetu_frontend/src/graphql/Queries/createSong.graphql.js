import gql from "graphql-tag";

export const CREATE_SONG = gql`
  query createSong($search: String, $page: Int, $first: Int) {
    songs(first: $first, page: $page, songsSearch: { search: $search }) {
      data {
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
      }
    }
  }
`;
