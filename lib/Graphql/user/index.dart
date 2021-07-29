class User {
  static String users = r'''
    query Query($usersFilter: FilterInput!) {
      users(filter: $usersFilter) {
        id
        fullName
        phoneNumber
        email
        userName
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
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
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
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
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
        bio
        birthDate
        gender
        instagram
        twitter
        telegram
        facebook
        verified
        activated
        token
        createdAt
        updatedAt
      }
    }
  ''';

  static String signUp = r'''
    mutation Mutation($signUpData: SignUpInput) {
      signUp(data: $signUpData) {
        id
        fullName
        phoneNumber
        email
        userName
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
        bio
        birthDate
        gender
        instagram
        twitter
        telegram
        facebook
        verified
        activated
        token
        createdAt
        updatedAt
      }
    }
  ''';

  static String login = r'''
    mutation Mutation($loginData: LoginInput) {
      login(data: $loginData) {
        id
        fullName
        phoneNumber
        email
        userName
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
        bio
        birthDate
        gender
        instagram
        twitter
        telegram
        facebook
        verified
        activated
        token
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
        avatar {
          size
          ext
          mime
          url
          name
          id
        }
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
