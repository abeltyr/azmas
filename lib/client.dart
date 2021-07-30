import 'package:azmas/Model/User/index.dart';
import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Config {
  static final headers = {
    "Content-Type": "application/json",
  };
  static final _httpLink = HttpLink(
    'http://192.168.0.170:4000/graphql',
    defaultHeaders: headers,
  );

  static final AuthLink _authLink = AuthLink(
    headerKey: "authorization",
    getToken: () async {
      UserModel? _currentUser = Hive.box<UserModel>('users').get("currentUser");
      if (_currentUser != null) return _currentUser.token;
      return null;
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
