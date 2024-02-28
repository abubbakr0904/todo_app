import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class Focuse extends StatefulWidget {
  const Focuse({super.key});

  @override
  State<Focuse> createState() => _FocuseState();
}

class _FocuseState extends State<Focuse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        centerTitle: true,
        title: Text(
          "Focuse",
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
