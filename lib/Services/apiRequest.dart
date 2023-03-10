import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void resetPassword() async {
  HttpLink link = HttpLink("https://client1.ed-space.net/api/graphql");
  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  );
  QueryResult queryResult = await qlClient.query(QueryOptions(document: gql("""
mutation {
  resetpassword(){
    email
    areakey
  }
}
""")));
}
