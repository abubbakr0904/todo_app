import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/lcoal/local_database/local.dart';
import 'package:todo_app/screens/home_screen/widget/task_title_dialog.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

import '../../data/model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskModel taskModel = TaskModel.initialValue;

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    taskModel.canAddTaskToDatabase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImages.burger),
                  Text("Index" , style: TextStyle(
                    color : Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppImages.fontLato
                  ),),
                  Image.asset(AppImages.profilePhoto , width: 42.w, fit: BoxFit.cover,),

                ],
              ),
            ),
            SizedBox(height: 70.h,),
            Image.asset(AppImages.homeScreen),
            SizedBox(height: 10.h,),
            Text("What do you want to do today?" , style: TextStyle(
                color : Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppImages.fontLato
            ),),
            Text("Tap + to add your tasks" , style: TextStyle(
                color : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppImages.fontLato
            ),),
          ],
        ),
      ),
      backgroundColor: AppColor.activeColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.itemColor,
          onPressed: () {
            textFieldDialog(
                context: context,
                taskModel: (task) {
                  taskModel = task;
                },
                description: (String value){
                  taskModel.copyWith(description: value);

                }
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.r))),
          child: SvgPicture.asset(AppImages.plus)),
    );
  }
}

