class Ticket {
  static String ticket = r'''
    query Query($ticketId: ID!) {
      ticket(id: $ticketId) {
        id
        userId
        communityId
        eventId
        price
        used
        createdAt
        updatedAt
      }
    }
  ''';

  static String tickets = r'''
    query Query($ticketsFilter: FilterInput!, $ticketsEventId: ID!) {
      tickets(filter: $ticketsFilter, eventId: $ticketsEventId) {
        id
        userId
        communityId
        eventId
        price
        used
        createdAt
        updatedAt
      }
    }
  ''';

  static String createTicket = r'''
    mutation CreateTicketMutation($createTicketData: CreateTicketInput) {
      createTicket(data: $createTicketData) {
        id
        userId
        communityId
        eventId
        price
        used
        createdAt
        updatedAt
      }
    }
  ''';

  static String updateTicket = r'''
    mutation UpdateTicketMutation($updateTicketId: ID!, $updateTicketData: UpdateTicketInput) {
      updateTicket(id: $updateTicketId, data: $updateTicketData) {
        id
        userId
        communityId
        eventId
        price
        used
        createdAt
        updatedAt
      }
    }
  ''';

  static String deleteTicket = r'''
    mutation UpdateTicketMutation($deleteTicketId: ID!) {
      deleteTicket(id: $deleteTicketId)
    }
  ''';
}
