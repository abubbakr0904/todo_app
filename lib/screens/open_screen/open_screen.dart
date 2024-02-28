import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/screens/on_boarding/on_boarding.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const OnBoarding();
            },
          ),
        );
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: phoneWidth,
        height: phoneHeight,
        child: Center(
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                SvgPicture.asset(AppImages.logo),
                SizedBox(height: 30.h,),
                Text("UpTodo" , style: TextStyle(
                    fontFamily: AppImages.fontLato,
                    fontSize: 40.sp,
                    color : Colors.white,
                    fontWeight: FontWeight.w700
                ),)
              ],
            )
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}

