import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../conts/app_colors.dart';
import '../../../../../conts/app_height_width.dart';
import '../../../../../conts/app_lists/department_name_list.dart';
import '../../../../app_widgets/widgets.dart';

class DropdownButtonFFWidget extends StatelessWidget {
  final dynamic onChanged;
  final List listName;
  final IconData icon;
  final bool isFillColor;
  final Color fillColor;
  final String valueName;
  const DropdownButtonFFWidget({
    super.key, required this.onChanged, required this.listName, required this.icon,
    this.fillColor = secondaryColor,  this.isFillColor = false, this.valueName = 'department',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: secondaryColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a $valueName';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Select $valueName',
          labelStyle: GoogleFonts.poppins(
            fontSize: heightX*.014,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          hintStyle: GoogleFonts.poppins(
            fontSize: heightX*.014,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: primaryColor, // Default border color
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
          ),
          fillColor: isFillColor? fillColor : Colors.black.withAlpha(300),
          prefixIcon: Icon(icon,
            color: accentColor,
          ),
          suffixIconColor: primaryColor
      ),
      items: listName.map((dept) {
        return DropdownMenuItem<String>(
          value: dept,
          child: SizedBox(
            width: widthX*.5,
            child: AppTextWidget(
              title: dept,
              overflow: true,
              textColor: primaryColor,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
