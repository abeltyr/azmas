class GroupMember {
  static String groupMember = r'''
    query Query($groupMemberId: ID!) {
      groupMember(id: $groupMemberId) {
        id
        userId
        groupId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String groupMembers = r'''
    query Query($groupMembersFilter: FilterInput!, $groupMembersGroupId: ID!) {
      groupMembers(filter: $groupMembersFilter, groupId: $groupMembersGroupId) {
        id
        userId
        groupId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String addGroupMember = r'''
    mutation Mutation($addGroupMemberData: CreateGroupMemberInput) {
      addGroupMember(data: $addGroupMemberData) {
        id
        userId
        groupId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String updateGroupMember = r'''
    mutation Mutation($updateGroupMemberId: ID!, $updateGroupMemberData: UpdateGroupMemberInput) {
      updateGroupMember(id: $updateGroupMemberId, data: $updateGroupMemberData) {
        id
        userId
        groupId
        banned
        admin
        createdAt
        updatedAt
      }
    }
  ''';

  static String removeGroupMember = r'''
    mutation Mutation($removeGroupMemberId: ID!) {
      removeGroupMember(id: $removeGroupMemberId)
    }
  ''';
}
