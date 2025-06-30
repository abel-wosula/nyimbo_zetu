import { createUploadLink } from "@/lib/createUploadLink";
import {
  ApolloClient,
  ApolloLink,
  InMemoryCache,
  createHttpLink,
} from "@apollo/client/core";

const { httpLink } = createHttpLink({
  uri: "http://localhost:8000/graphql",
});

const getAuthToken = () => {
  return localStorage.getItem("auth_token")
}
const uploadLink = createUploadLink({
  uri: "http://localhost:8000/graphql/", // or your server URL
  headers: {
    Authorization: `Bearer ${getAuthToken()}`,
  },
});

const cache = new InMemoryCache();
const link = ApolloLink.from([uploadLink, httpLink]);
const apolloClient = new ApolloClient({
  link,
  cache,
});

export default apolloClient;
