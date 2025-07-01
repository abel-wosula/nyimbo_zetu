import { ApolloLink, Observable } from "@apollo/client/core";

export function createUploadLink({ uri }) {
  return new ApolloLink((operation) => {
    return new Observable((observer) => {
      const body = new FormData();

      const { variables, query } = operation;
      const operationObj = {
        query: query.loc.source.body,
        variables,
      };

      body.append("operations", JSON.stringify(operationObj));

      const map = {};
      const files = [];
      let i = 0;

      const collectFiles = (obj, path = "variables") => {
        for (const key in obj) {
          const value = obj[key];
          const currentPath = `${path}.${key}`;
          if (value instanceof File) {
            map[i] = [currentPath];
            files.push(value);
            i++;
          } else if (value && typeof value === "object") {
            collectFiles(value, currentPath);
          }
        }
      };

      collectFiles(variables);
      body.append("map", JSON.stringify(map));
      files.forEach((file, index) => {
        body.append(index.toString(), file);
      });

      fetch(uri, {
        method: "POST",
        body,
        credentials: "include",
      })
        .then((res) => res.json())
        .then((data) => {
          observer.next(data);
          observer.complete();
        })
        .catch((err) => observer.error(err));
    });
  });
}
