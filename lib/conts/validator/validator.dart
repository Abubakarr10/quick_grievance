import 'package:flutter/foundation.dart';

String emptyValidator(value, returnMessage){
  if (kDebugMode) {
    print('Value empty: $value');
  }
  if (value!.isEmpty) {
    return returnMessage;
  }
  return 'null';
}

String phoneNumberValidator(value){
// Check if it starts with +92
if (kDebugMode) {
  print('Value Phone: $value');
}
  if (!value.startsWith('+92')) {
    return 'Phone number must start with +92';
  }

// Remove +92 and check remaining digits
  String numberPart = value.replaceFirst('+92', '');
  if (numberPart.length != 10 || !RegExp(r'^\d{10}$').hasMatch(numberPart)) {
    return 'Phone number must be 10 digits after +92';
  }

  return 'null';
}