import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.activeColor,
        centerTitle: true,
        title: Text(
          "Profile",
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
