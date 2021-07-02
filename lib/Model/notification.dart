enum imagetype { Assets, Network, File }

class NotificationModel {
  String id;
  String title;
  String message;
  String image;
  imagetype imageType;
  String redirect;
  bool read;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.image,
    this.imageType = imagetype.Assets,
    required this.redirect,
    this.read = false,
  });
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
