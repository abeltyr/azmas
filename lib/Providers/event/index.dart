import 'package:azmas/Graphql/event/index.dart';
import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Model/Community/index.dart';
import 'package:azmas/client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EventProvider with ChangeNotifier {
  List<EventModel>? _events =
      Hive.box<List<EventModel>>('events').get("eventHistory");

  List<EventModel>? get events {
    if (_events == null)
      return [];
    else
      return _events;
  }

  Future<List<EventModel>?> fetchEvent(
      {required int skip, required int take}) async {
    final QueryResult result = await Config.initializeClient().query(
      QueryOptions(
        document: gql(Event.events),
        variables: {
          'eventsFilter': {
            "skip": skip,
            "take": take,
            "order": "asc",
          },
        },
      ),
    );
    if (result.hasException) {
      print("exception");
      print(result.exception!.graphqlErrors.toString());
      print(result.exception!.linkException.toString());
      throw FormatException(result.exception.toString());
    } else {
      final res = result.data!["events"];
      List<EventModel>? eventsData = [];
      for (var data in res) {
        eventsData.add(
          EventModel(
            id: data["id"],
            title: data["title"],
            description: data["description"],
            horizontal: data["horizontal"],
            category: data["category"],
            creatorId: data["creatorId"],
            eventStartDate: DateTime.parse(data["eventStartDate"]),
            eventEndDate: DateTime.parse(data["eventEndDate"]),
            price: 100.00,
            community: CommunityModel(
              id: data["community"]!["id"],
              avatar: data["community"]!["avatar"]!["url"],
              background: data["community"]!["background"]!["url"],
              category: data["community"]!["category"],
              description: data["community"]!["description"],
              title: data["community"]!["title"],
              activated: data["community"]!["activated"],
              public: data["community"]!["public"],
              ownerId: data["community"]!["ownerId"],
              verified: data["community"]!["verified"],
              createdAt: DateTime.parse(data["community"]!["createdAt"]),
              updatedAt: DateTime.parse(data["community"]!["updatedAt"]),
            ),
            communityId: data["communityId"],
            user: data["user"],
            image: data["image"]!["url"],
            location: data["location"],
            createdAt: DateTime.parse(data["createdAt"]),
            updatedAt: DateTime.parse(data["updatedAt"]),
          ),
        );
      }
      _events = eventsData;
      return _events;
    }
  }
}
