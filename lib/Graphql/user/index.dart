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

  static String user = r'''
    query Query($userId: ID!) {
      user(id: $userId) {
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

  static String currentUser = r'''
    query Query {
      currentUser {
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

  static String createUser = r'''
    mutation Mutation($createUserData: CreateUserInput) {
      createUser(data: $createUserData) {
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

  static String updateUser = r'''
    mutation Mutation($updateUserId: ID!, $updateUserData: UpdateUserInput) {
      updateUser(id: $updateUserId, data: $updateUserData) {
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

  static String deleteUser = r'''
    mutation Mutation($deleteUserId: ID!) {
      deleteUser(id: $deleteUserId)
    }
  ''';
}
