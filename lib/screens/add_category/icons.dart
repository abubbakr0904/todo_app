import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/lcoal/local_database/local.dart';
import 'package:todo_app/data/model/category_model/category_model.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

import '../home_screen/widget/category_with_color.dart';

openCategoryIcon({required BuildContext context , required ValueChanged<String> icon}) {
  int selectedCategory = 0;
  TaskModel taskModel = TaskModel.initialValue;
  CategoryModel catModel = CategoryModel.initialValue;


  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
        child: Material(
          color: const Color(0xFF363636),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Choose Category",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                height: 2.h,
                width: double.infinity,
                color: Colors.white,
              ),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 0.9,
                  padding: EdgeInsets.all(24.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  children: List.generate(
                    icons.length,
                        (index) => GestureDetector(
                      onTap: () {
                        selectedCategory = index;
                        setState(() {});
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: selectedCategory == index ? Colors.white.withOpacity(0.7) : Colors.white.withOpacity(0.2)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    icons[index],
                                    width: 32.w,
                                    height: 32.h,
                                    color : Colors.white
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  icon.call(icons[selectedCategory]);
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.itemColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.r),
                      )),
                  child: Center(
                    child: Text(
                      "Add Category",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppImages.fontLato),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      );
    }),
  );
}
List<String> icons = [
  AppImages.alarm,
  AppImages.repair,
  AppImages.notePencil,
  AppImages.strategy,
  AppImages.studentCap,
  AppImages.message,
  AppImages.meet,
  AppImages.code,
  AppImages.video,
];