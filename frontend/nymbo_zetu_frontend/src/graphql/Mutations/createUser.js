import { gql } from "@apollo/client/core";
export const REGISTER_USER = gql`
  mutation createUser($input: CreateUserInput!) {
    createUser(input: $input) {
      user {
        email
        first_name
        last_name
        phone_number
        address
        password
      }
    }
  }
`;
