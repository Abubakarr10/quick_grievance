import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/response_model.dart';
import '../../services/config.dart';


class ComplainProvider extends GetConnect {

//   Future<dynamic> submitComplain(complaintType,description,priority,imageFile) async {
//
//     final prompt = '''
// You are a complaint analyst. Analyze the following complaint submitted by a user.
// Determine the urgency level (High, Medium, Low) based on the given fields.
//
// Complaint Type: $complaintType
// Description: $description
// User's Selected Priority: $priority
//
//  ${imageFile != null ? 'Note: The user has also attached an image.' : ''}
//  ''';
//
//     final body = {
//       "model": modelG,
//       "messages": [
//         {
//           "role": "system",
//           "content": "You are a complaint analyst. Your job is to analyze user complaints and identify their priority level (e.g., high, medium, low) based on the urgency and content of the complaint."
//         },
//         {
//           "role": "user",
//           "content": prompt
//         }
//       ],
//       "max_tokens": 100
//     };
//
//     final response = await post(
//       baseUrl,
//       body,
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//         'Content-Type': 'application/json'
//       },
//     ).timeout(const Duration(seconds: 25));
//
//     if (response.statusCode == 200) {
//       final decoded = json.decode(response.bodyString!);
//       final model = ResponseModel.fromJson(decoded);
//       final replyText = model.choices.first.message.content;
//
//       if (kDebugMode) {
//         print('AI Response: $replyText');
//       }
//
//       return replyText;
//     } else {
//       if (kDebugMode) {
//         print("Error==:> ${response.statusCode} - ${response.statusText}");
//         print("Response Body==:> ${response.bodyString}");
//         if (response.bodyString == null) {
//           return 'Empty response from server';
//         }
//         final decoded = json.decode(response.bodyString!);
//         return decoded;
//       }
//     }
//
//     return 'no response from AI';
//   }


  Future<String> submitComplain( // Explicitly return String instead of dynamic
      String complaintType,
      String description,
      String priority,
      String? imageFile, // Make imageFile nullable
      ) async {
    try {
      final prompt = '''
You are a complaint analyst. Analyze the following complaint submitted by a user.
Determine the urgency level (High, Medium, Low) based on the given fields.

Complaint Type: $complaintType
Description: $description
User's Selected Priority: $priority

${imageFile != null ? 'Note: The user has also attached an image.' : ''}
''';

      final body = {
        "model": modelG, // Ensure modelG is defined
        "messages": [
          {
            "role": "system",
            "content": "You are a complaint analyst...",
          },
          {
            "role": "user",
            "content": prompt,
          },
        ],
        "max_tokens": 100,
      };

      final response = await post(
        baseUrl, // Ensure baseUrl is defined
        body,
        headers: {
          'Authorization': 'Bearer $apiKey', // Ensure apiKey is defined
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 25));

      if (response.statusCode != 200) {
        return 'Error: API request failed (${response.statusCode})';
      }

      if (response.bodyString == null) {
        return 'Error: Empty response from server';
      }

      if (kDebugMode) {
        print('API Response: ${response.bodyString}');
      } // Debug log

      try {
        final decoded = json.decode(response.bodyString!);

        // Manually check if the response has the expected structure
        if (decoded['choices'] == null || decoded['choices'].isEmpty) {
          return 'Error: Invalid AI response format';
        }

        final replyText = decoded['choices'][0]['message']['content'] ?? 'No response';
        return replyText;

      } catch (e) {
        return 'Error parsing AI response: $e';
      }
    } catch (e) {
      return 'Failed to submit complaint: $e';
    }
  }

}
