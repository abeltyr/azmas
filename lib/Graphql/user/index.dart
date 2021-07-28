class User {
  static String users = r'''
    query Query($usersFilter: FilterInput!) {
      users(filter: $usersFilter) {
        id
        fullName
        phoneNumber
        email
        userName
        bio
        birthDate
        gender
        instagram
        twitter
        telegram
        facebook
        verified
        activated
        createdAt
        updatedAt
      }
    }
  ''';
}
