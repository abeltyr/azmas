class Group {
  static String group = r'''
    query Query($groupId: ID!) {
      group(id: $groupId) {
        id
        groupName
        ownerId
        title
        description
        public
        activated
        verified
        influencer
        category
        createdAt
        updatedAt
      }
    }
  ''';

  static String groups = r'''
    query Query($groupsFilter: FilterInput!) {
      groups(filter: $groupsFilter) {
        id
        groupName
        ownerId
        title
        description
        public
        activated
        verified
        influencer
        category
        createdAt
        updatedAt
      }
    }
  ''';

  static String createGroup = r'''
    mutation Mutation($createGroupData: CreateGroupInput) {
      createGroup(data: $createGroupData) {
        id
        groupName
        ownerId
        title
        description
        public
        activated
        verified
        influencer
        category
        createdAt
        updatedAt
      }
    }
  ''';

  static String updateGroup = r'''
    mutation Mutation($updateGroupId: ID!, $updateGroupData: UpdateGroupInput) {
      updateGroup(id: $updateGroupId, data: $updateGroupData) {
        id
        groupName
        ownerId
        title
        description
        public
        activated
        verified
        influencer
        category
        createdAt
        updatedAt
      }
    }
  ''';

  static String deleteGroup = r'''
    mutation Mutation($deleteGroupId: ID!) {
      deleteGroup(id: $deleteGroupId)
    }
  ''';
}
