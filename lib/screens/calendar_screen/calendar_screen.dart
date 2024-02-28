import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        centerTitle: true,
        title: Text(
          "Calendar",
          style: TextStyle(
              color: Colors.white,
              fontFamily: AppImages.fontLato,
              fontSize: 30.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}
