import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/response_model.dart';
import '../../services/config.dart';


class ComplainProvider extends GetConnect {

  Future<dynamic> submitComplain(complaintType,description,priority,) async {


    final prompt = '''
You are a complaint analyst. Analyze the following complaint submitted by a user.
Determine the urgency level (High, Medium, Low) based on the given fields.

Complaint Type: $complaintType
Description: $description
User's Selected Priority: $priority
''';
// ${imageFile != null ? 'Note: The user has also attached an image.' : ''}
// ''';

    final body = {
      "model": modelG,
      "messages": [
        {
          "role": "system",
          "content": "You are a complaint analyst. Your job is to analyze user complaints and identify their priority level (e.g., high, medium, low) based on the urgency and content of the complaint."
        },
        {
          "role": "user",
          "content": prompt
        }
      ],
      "max_tokens": 100
    };

    final response = await post(
      baseUrl,
      body,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json'
      },
    ).timeout(const Duration(seconds: 25));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.bodyString!);
      final model = ResponseModel.fromJson(decoded);
      final replyText = model.choices.first.message.content;

      if (kDebugMode) {
        print('AI Response: $replyText');
      }

      return replyText;
    } else {
      if (kDebugMode) {
        print("Error==:> ${response.statusCode} - ${response.statusText}");
        print("Response Body==:> ${response.bodyString}");
      }
    }

    return null;
  }

}
