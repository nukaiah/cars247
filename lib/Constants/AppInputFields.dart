import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget EmailFiled({required labelText, required hintText}) {
  return TextFormField(
    style: TxtStyles.inputStyle,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
       prefixIcon: const Icon(Icons.email_rounded),
        labelText: labelText,
        labelStyle: TxtStyles.labelStyle,
        hintText: hintText,
        hintStyle: TxtStyles.hintStyle,
        errorStyle: TxtStyles.errorStyle,
        border: border,
        enabledBorder: enableBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Email cannot be empty";
      } else if (!RegExp(r'^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(value)) {
        return "Enter a valid email";
      } else {
        return null;
      }
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
  );
}
Widget PasswordField({required labelText, required hintText}) {
  return TextFormField(
    style: TxtStyles.inputStyle,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
        prefixIcon: const Icon(Icons.security_rounded),
        labelText: labelText,
        labelStyle: TxtStyles.labelStyle,
        hintText: hintText,
        hintStyle: TxtStyles.hintStyle,
        errorStyle: TxtStyles.errorStyle,
        border: border,
        enabledBorder: enableBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder
    ),
    validator: (value) {
      if(value!.isEmpty){
        return "Password cannot be empty";
      }
      else if(value.length<6){
        return "Password should be at least 6 Characters";
      }
      else {
        return null;
      }
    },
    textInputAction: TextInputAction.next,
  );
}
Widget NameField({required labelText, required hintText}) {
  return TextFormField(
    style: TxtStyles.inputStyle,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TxtStyles.labelStyle,
      hintText: hintText,
      hintStyle: TxtStyles.hintStyle,
      errorStyle: TxtStyles.errorStyle,
      border: border,
      enabledBorder: enableBorder,
      focusedBorder: focusedBorder,
      focusedErrorBorder: focusedErrorBorder,
      errorBorder: errorBorder
    ),
    validator: (value) {
      if(value!.isEmpty){
        return "$labelText cannot be empty";
      }
      else{
        return null;
      }
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.name,
    inputFormatters: [
      LengthLimitingTextInputFormatter(50),
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Z]'),
      )
    ],
  );
}

Widget MobileFiled({required labelText, required hintText}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TxtStyles.inputStyle,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TxtStyles.labelStyle,
      hintText: hintText,
      hintStyle: TxtStyles.hintStyle,
      errorStyle: TxtStyles.errorStyle,
      border: border,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
      focusedBorder: focusedBorder,
      enabledBorder: enableBorder,
      prefixIcon: Icon(Icons.phone)
    ),
    validator: (value) {
      if(value!.isEmpty){
        return "$labelText cannot be empty";
      }
      else if(value.length!=10){
        return "$labelText should be 10 digits";
      }
      else{
        return null;
      }
    },
    textInputAction: TextInputAction.next,
    keyboardType: const TextInputType.numberWithOptions(decimal: false),
    inputFormatters: [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly,
    ],
  );
}


OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 1)
);
OutlineInputBorder enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: blackClr,width: 1));
OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: g3,width: 1.5));
OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: g4,width: 1));
OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: g4,width: 1));
