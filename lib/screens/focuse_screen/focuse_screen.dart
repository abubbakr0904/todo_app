import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/data.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class Focuse extends StatefulWidget {
  const Focuse({super.key});

  @override
  State<Focuse> createState() => _FocuseState();
}

class _FocuseState extends State<Focuse> {
  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: pw,
        height: ph,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              box.values.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.sp,
                  fontFamily: AppImages.fontLato,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h,),
            Text(
              "The number of things you did",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontFamily: AppImages.fontLato,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}
