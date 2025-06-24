import gql from "graphql-tag";

export const CREATE_CATEGORY = gql`
  query createCategory {
    category(first: 10, page: 1) {
      data {
       name
      }
      paginatorInfo {
        total
        currentPage
        hasMorePages
      }
    }
  }
`;
