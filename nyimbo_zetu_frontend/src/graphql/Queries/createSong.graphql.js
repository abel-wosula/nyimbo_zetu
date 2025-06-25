import gql from "graphql-tag";

export const CREATE_SONG = gql`
  query createSong {
    songs(first: 10, page: 1) {
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
