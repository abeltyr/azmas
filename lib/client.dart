import 'package:graphql/client.dart';

class Config {
  static final headers = {
    "Content-Type": "application/json",
  };
  static final _httpLink = HttpLink(
    'http://192.168.0.170:4000/graphql',
    defaultHeaders: headers,
  );

  static final AuthLink _authLink = AuthLink(
    getToken: () async {
      final storage = "LocalStorage.instance";
      return storage;
    },
  );
  static Link _link = _authLink.concat(_httpLink);

  static GraphQLClient initializeClient() {
    final _policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );
    final GraphQLClient _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
      defaultPolicies: DefaultPolicies(
        watchQuery: _policies,
        query: _policies,
        mutate: _policies,
      ),
    );

    return _client;
  }
}
