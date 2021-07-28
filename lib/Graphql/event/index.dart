class Event {
  static String event = r'''
    query Query($eventId: ID!) {
      event(id: $eventId) {
        id
        creatorId
        groupId
        group {
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
        groupId
        group {
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
        groupId
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
        groupId
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
