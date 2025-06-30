import gql from "graphql-tag";

export const CREATE_SUBCATEGORY = gql`
  query createSubCategory {
    subcategory(first: 100) {
      data {
        id
        name
        category_id

        category {
          id
          name
        }
      }
      paginatorInfo {
        total
        currentPage
        hasMorePages
      }
    }
  }
`;
