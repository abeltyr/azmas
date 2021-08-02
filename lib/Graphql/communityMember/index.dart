class CommunityMember {
  static String communityMember = r'''
    query Query($communityMemberId: ID!) {
      communityMember(id: $communityMemberId) {
        id
        userId
        communityId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String communityMembers = r'''
    query Query($communityMembersFilter: FilterInput!, $communityMembersCommunityId: ID!) {
      communityMembers(filter: $communityMembersFilter, communityId: $communityMembersCommunityId) {
        id
        userId
        communityId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String addCommunityMember = r'''
    mutation Mutation($addCommunityMemberData: CreateCommunityMemberInput) {
      addCommunityMember(data: $addCommunityMemberData) {
        id
        userId
        communityId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String updateCommunityMember = r'''
    mutation Mutation($updateCommunityMemberId: ID!, $updateCommunityMemberData: UpdateCommunityMemberInput) {
      updateCommunityMember(id: $updateCommunityMemberId, data: $updateCommunityMemberData) {
        id
        userId
        communityId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String removeCommunityMember = r'''
    mutation Mutation($removeCommunityMemberId: ID!) {
      removeCommunityMember(id: $removeCommunityMemberId)
    }
  ''';
}
