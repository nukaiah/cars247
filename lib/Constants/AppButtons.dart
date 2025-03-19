import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:flutter/material.dart';

Widget MyButton({title,onTap}){
  return InkWell(
    onTap:onTap,
    child: Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          color: indClr,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text(title,style: TxtStyles.whiteStyle),
    ),
  );
}

Widget MyOutlineButton({title}){
  return MaterialButton(
    elevation: 0.0,
    height: 40,
    color: indClr.withOpacity(0.25),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(title,style: TxtStyles.clickStyle),
    onPressed: (){},
  );
}

Widget MyFillButton({title}){
  return MaterialButton(
    height: 40,
    elevation: 0.0,
    color: indClr,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(title,style: TxtStyles.whiteStyle),
    onPressed: (){},
  );
}