import gql from "graphql-tag";

const USER_PROFILE = gql`
  query getUserProfile($id: ID!) {
    user(id: $id) {
      id
      name
      email
      phone
      address
      city
      state
      country
      image
    }
  }
`;
export default USER_PROFILE;
