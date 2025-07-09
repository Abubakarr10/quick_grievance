import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/notification_model.dart';

Future<void> sendNotificationToUser({
  required String title,
  required String description,
  required String body,
  required String userId,
  required String type,
  required String typeId,
}) async {
  final now = DateTime.now();
  final formattedDate = "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}";

  final notification = NotificationModel(
    title: title,
    description: description,
    body: body,
    userId: userId,
    dateTime: formattedDate,
    type: type,
    typeId: typeId,
  );

  await FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toJson());
}
