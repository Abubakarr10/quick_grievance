import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_height_width.dart';

import '../../conts/app_colors.dart';

class AppTextFormFieldWidget extends StatelessWidget {

  final TextEditingController ctrl;
  final TextInputType keyType;
  final String returnMessage;
  final String labelText;
  final Color mainColor;
  final String? iconPath;
  final double width;
  final double height;
  final double? borderRadius;
  final double? disabledBorderRadius;
  final double? enabledBorderRadius;
  final int? maxLength;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? showSuffixIcon;
  final bool? showPrefixIcon;
  final bool? visiblePassword;
  final VoidCallback? onTap;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? iconColor;
  final bool? noneBorder;
  final Color? textColor;
  final bool customValidator;
  final dynamic validator;

  const AppTextFormFieldWidget({super.key,
    required this.ctrl,
    required this.keyType,
    this.labelText = '',
    this.returnMessage = 'return message',
    this.iconPath = '',
    this.mainColor = const Color(0XFF7D7245),
    this.height = 40,
    this.width = 100,
    this.marginLeft = 20,
    this.marginRight = 20,
    this.marginTop = 20,
    this.borderRadius = 25,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.disabledBorderRadius = 0,
    this.enabledBorderRadius = 0,
    this.maxLength,
    this.showSuffixIcon = false,
    this.visiblePassword = false,
    this.onTap,
    this.suffixIcon = Icons.search,
    this.iconColor = Colors.grey,
    this.showPrefixIcon = false,
    this.prefixIcon,
    this.noneBorder = false,
    this.textColor = accentColor,
    this.customValidator = false,
    this.validator = const (),
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: ctrl,
      cursorColor: accentColor,
      maxLength: maxLength,
      obscureText: visiblePassword!,
      obscuringCharacter: '*',style: TextStyle(fontWeight: FontWeight.normal,
        fontStyle: visiblePassword == true? FontStyle.italic : FontStyle.normal,
      color: accentColor
    ),
      cursorHeight: height/2.2,
      keyboardType: keyType,
      validator: customValidator == true? validator : (value) {
        if (value!.isEmpty) {
          return returnMessage;
        }
        return null;
      },
      decoration: InputDecoration(
          filled: true,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          counterText: '',
          fillColor: mainColor,
          focusColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(
              color: primaryColor,
              fontSize: heightX*.014,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'
          ),
          enabledBorder: noneBorder == true? InputBorder.none :
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide:   const BorderSide(
                  color: secondaryColor,
                width: 2
              )
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide:  const BorderSide(
                  color: secondaryColor,
                width: 2
              )
          ),
          focusedBorder: noneBorder == true? InputBorder.none : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide:  const BorderSide(
                  color: borderColor,
                  width: 3
              )
          ),
          prefixIcon: showPrefixIcon == true? Icon(prefixIcon,color: iconColor,) : null,
          prefixIconColor: mainColor,
          floatingLabelBehavior: floatingLabelBehavior,
          suffixIcon: showSuffixIcon == true? InkWell(
            onTap: (){
              if(showSuffixIcon == true){
                onTap!();
              }
            },
            child: visiblePassword == true?
            const  Icon(CupertinoIcons.eye_slash, color: primaryColor,) :
            const Icon(CupertinoIcons.eye, color: accentColor,size: 20,),
          ) : null
      ),
    );
  }
}
