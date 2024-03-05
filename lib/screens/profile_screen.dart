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
  TextEditingController cont = TextEditingController();
  String name = "";
  @override
  Widget build(BuildContext context) {
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.w),
          width: pw,
          height: ph,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter name",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 60.h,
                child: TextField(
                  onChanged: (v){
                    name = v;
                    setState(() {

                    });
                  },
                  style: TextStyle(
                      color : Colors.white,
                      fontSize: 15.sp
                  ),
                  decoration: InputDecoration(
                    hintText: "Name",

                    hintStyle: TextStyle(
                        color : Colors.white,
                        fontSize: 15.sp
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: AppColor.itemColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.w, color: AppColor.itemColor)),
                  ),
                ),

              ),
              SizedBox(height: 20.h,),
              Text(
                "Your name : $name" ,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    fontFamily: AppImages.fontLato),
              ),
            ],
          ),),

      backgroundColor: AppColor.activeColor,
    );
  }
}
