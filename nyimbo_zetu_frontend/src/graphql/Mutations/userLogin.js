import gql from "graphql-tag";

export const LOGIN_USER = gql`
  mutation UserLogin($email: String!, $password: String!) {
    userLogin(email: $email, password: $password) {
      token
      user {
        id
        email
      }
    }
  }
`;
