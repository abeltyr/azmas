class Event {
  static String event = r'''
    query Query($eventId: ID!) {
      event(id: $eventId) {
        id
        creatorId
        communityId
        community {
          id
          communityName
          ownerId
          title
          avatar {
            size
            ext
            mime
            url
            name
            id
          }
          background {
            size
            ext
            mime
            url
            name
            id
          }
          description
          public
          activated
          verified
          influencer
          category
          createdAt
          updatedAt
        }
        image {
          size
          ext
          mime
          url
          name
          id
        }
        title
        description
        horizontal
        eventStartDate
        category
        eventEndDate
        location
        price
        createdAt
        updatedAt
      }
    }
  ''';

  static String events = r'''
    query Query($eventsFilter: FilterInput!) {
      events(filter: $eventsFilter) {
        id
        creatorId
        communityId
        community {
          id
          communityName
          ownerId
          title
          avatar {
            size
            ext
            mime
            url
            name
            id
          }
          background {
            size
            ext
            mime
            url
            name
            id
          }
          description
          public
          activated
          verified
          influencer
          category
          createdAt
          updatedAt
        }
        image {
          size
          ext
          mime
          url
          name
          id
        }
        title
        description
        horizontal
        eventStartDate
        category
        eventEndDate
        location
        price
        createdAt
        updatedAt
      }
    }
  ''';

  static String createEvent = r'''
    mutation Mutation($createEventData: CreateEventInput) {
      createEvent(data: $createEventData) {
        id
        creatorId
        communityId
        community {
          id
          communityName
          ownerId
          title
          avatar {
            size
            ext
            mime
            url
            name
            id
          }
          background {
            size
            ext
            mime
            url
            name
            id
          }
          description
          public
          activated
          verified
          influencer
          category
          createdAt
          updatedAt
        }
        image {
          size
          ext
          mime
          url
          name
          id
        }
        title
        description
        horizontal
        eventStartDate
        category
        eventEndDate
        location
        price
        createdAt
        updatedAt
        
      }
    }
  ''';

  static String updateEvent = r'''
    mutation Mutation($updateEventId: ID!, $updateEventData: UpdateEventInput) {
      updateEvent(id: $updateEventId, data: $updateEventData) {
        id
        creatorId
        communityId
        community {
          id
          communityName
          ownerId
          title
          avatar {
            size
            ext
            mime
            url
            name
            id
          }
          background {
            size
            ext
            mime
            url
            name
            id
          }
          description
          public
          activated
          verified
          influencer
          category
          createdAt
          updatedAt
        }
        image {
          size
          ext
          mime
          url
          name
          id
        }
        title
        description
        horizontal
        eventStartDate
        category
        eventEndDate
        location
        price
        createdAt
        updatedAt
      }
    }
  ''';

  static String deleteEvent = r'''
    mutation Mutation($deleteEventId: ID!) {
      deleteEvent(id: $deleteEventId)
    }
  ''';
}
