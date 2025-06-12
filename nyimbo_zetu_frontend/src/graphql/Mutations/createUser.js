import gql from 'graphql-tag';

export const REGISTER_USER = gql`
    mutation createUser($input: CreateUserInput!) {
        createUser(input: $input) {
            user {
                id
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
