import 'package:azmas/Model/event.dart';

class EnumSetter {
  String eventCategory(EventCategory? data) {
    if (data == EventCategory.Fun)
      return "Fun";
    else if (data == EventCategory.Education)
      return "Education";
    else if (data == EventCategory.GetTogether)
      return "Get Together";
    else if (data == EventCategory.SchoolEvent)
      return "School Event";
    else if (data == EventCategory.Seminars)
      return "Seminars";
    else
      return "Party";
  }
}
