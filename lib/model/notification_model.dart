class NotificationModel {
  final String title;
  final String description;
  final String body;
  final String userId;
  final String typeId;
  final String dateTime;
  final String type; // e.g., 'slip', 'complaint'

  NotificationModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.typeId,
    required this.dateTime,
    required this.type,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'body': body,
    'userId': userId,
    'typeId': typeId,
    'dateTime': dateTime,
    'type': type,
  };

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userId: json['userId'] ?? '',
      typeId: json['typeId'] ?? '',
      dateTime: json['dateTime'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? ''
    );
  }
}
