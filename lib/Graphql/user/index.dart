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

  static String personalDataUpdate = r'''
    mutation Mutation($personalDataUpdateData: PersonalDataUpdateInput) {
      personalDataUpdate(data: $personalDataUpdateData)
    }
  ''';

  static String accountDataUpdate = r'''
    mutation Mutation($accountDataUpdateData: AccountDataUpdateInput) {
      accountDataUpdate(data: $accountDataUpdateData)
    }
  ''';

  static String socailDataUpdate = r'''
    mutation Mutation($socailDataUpdateData: SocailDataUpdateInput) {
      socailDataUpdate(data: $socailDataUpdateData)
    }
  ''';

  static String securityDataUpdate = r'''
    mutation Mutation($securityDataUpdateData: SecurityDataUpdateInput) {
      securityDataUpdate(data: $securityDataUpdateData) {
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

  static String profileUpdate = r'''
    mutation ProfileUpdateMutation($profileUpdateUploadFileId: ID!) {
      profileUpdate(uploadFileId: $profileUpdateUploadFileId)
    }
  ''';

  static String deleteUser = r'''
    mutation Mutation($deleteUserId: ID!) {
      deleteUser(id: $deleteUserId)
    }
  ''';
}
