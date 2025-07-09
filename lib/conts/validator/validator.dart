import 'package:flutter/foundation.dart';

String? emptyValidator(value, returnMessage){
  if (kDebugMode) {
    print('Value empty: $value');
  }
  if (value!.isEmpty) {
    return returnMessage;
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name is required';
  }

  // Only alphabets, first letter capital, no digits/special chars
  final nameRegExp = RegExp(r'^[A-Z][a-zA-Z ]*$');

  if (!nameRegExp.hasMatch(value.trim())) {
    return 'Name must start with a capital letter and contain only letters';
  }

  return null;
}


String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

// Basic email format checks before regex
  if (!value.contains('@')) {
    return 'Email must contain "@" symbol';
  }

  final parts = value.split('@');
  if (parts.length != 2 || parts[0].isEmpty || parts[1].isEmpty) {
    return 'Email must be in format: name@example.com';
  }

  if (!parts[1].contains('.')) {
    return 'Domain must contain "." (e.g. example.com)';
  }

// Final regex check for edge cases
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return 'Email format is invalid (e.g. name@example.com)';
  }

  return null; // Valid email
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  // Must contain at least:
  // 1 lowercase letter, 1 uppercase letter, 1 number, 1 special character
  final RegExp passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>_\-+=/\\[\]]).{8,}$',
  );

  if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters long\nand include upper/lowercase letters,\na number, and a special character.';
  }

  return null;
}



String? phoneNumberValidator(value){
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

  return null;
}

String? roomNumberValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Room number is required';
  }

  final int? number = int.tryParse(value.trim());
  if (number == null) {
    return 'Room number must be a number';
  }

  if (number < 1 || number > 83) {
    return 'Room number must be between 1 and 83';
  }

  return null; // Valid
}

String? batchYearValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Batch year is required';
  }

  // Match format: 2021-25
  final RegExp batchFormat = RegExp(r'^\d{4}-\d{2}$');
  if (!batchFormat.hasMatch(value.trim())) {
    return 'Format must be like 2021-25';
  }

  final parts = value.split('-');
  final int? startYear = int.tryParse(parts[0]);
  final int? endYearSuffix = int.tryParse(parts[1]);

  if (startYear == null || endYearSuffix == null) {
    return 'Invalid year values';
  }

  if (startYear < 2021 || startYear > 2025) {
    return 'Start year must be from 2021 to 2025';
  }

  final int validEnd4 = (startYear + 4) % 100;
  final int validEnd5 = (startYear + 5) % 100;

  if (endYearSuffix != validEnd4 && endYearSuffix != validEnd5) {
    return 'End year must be ${startYear + 4} or ${startYear + 5}';
  }

  return null; // Valid
}

String? regNumberValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Registration number is required';
  }

  final String input = value.trim().toUpperCase();

  // Regex for both formats:
  final RegExp regExp = RegExp(
    r'^(2[1-5])-NTU-([A-Z]{2,3})(?:-FL)?-(\d{4})$',
  );

  final match = regExp.firstMatch(input);

  if (match == null) {
    return 'Format must be like 21-NTU-CS-1289 or 24-NTU-CS-FL-1100';
  }

 // final int batch = int.parse(match.group(1)!); // e.g. 21
  final String dept = match.group(2)!;          // e.g. CS, TT, TE
  final String regNo = match.group(3)!; // 4-digit number
  final int? regNumber = int.tryParse(regNo);

  // Optional: Validate known departments (you can expand this list)
  final List<String> allowedDepartments = ['CS','CT','TT','TE','PE','AS','GT','BA','DD','AM'];

  if (!allowedDepartments.contains(dept)) {
    return 'Invalid department code';
  }

  // Validate register number digits
  if (regNumber == null || regNumber < 1 || regNumber > 9999) {
    return 'Invalid registration number (must be 0001 to 9999)';
  }

  return null; // valid
}
