class Community {
  static String community = r'''
    query Query($communityId: ID!) {
      community(id: $communityId) {
        id
        communityName
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

  static String communities = r'''
    query Query($communitiesFilter: FilterInput!) {
      communities(filter: $communitiesFilter) {
        id
        communityName
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

  static String createCommunity = r'''
    mutation Mutation($createCommunityData: CreateCommunityInput) {
      createCommunity(data: $createCommunityData) {
        id
        communityName
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

  static String updateCommunity = r'''
    mutation Mutation($updateCommunityId: ID!, $updateCommunityData: UpdateCommunityInput) {
      updateCommunity(id: $updateCommunityId, data: $updateCommunityData) {
        id
        communityName
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

  static String deleteCommunity = r'''
    mutation Mutation($deleteCommunityId: ID!) {
      deleteCommunity(id: $deleteCommunityId)
    }
  ''';
}
