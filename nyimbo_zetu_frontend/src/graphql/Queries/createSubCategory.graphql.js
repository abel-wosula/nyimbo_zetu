import gql from "graphql-tag";

export const CREATE_CATEGORY = gql`
  query createSubCategory {
    subcategory(first: 10, page: 1) {
      data {
       name
       category_id
      }
      paginatorInfo {
        total
        currentPage
        hasMorePages
      }
    }
  }
`;
