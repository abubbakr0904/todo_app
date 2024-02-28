import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

colorsCategory(
    {required BuildContext context, required ValueChanged<int> catefory}) {
  int c = 2;
  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context , setState){
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
                "Task Priority",
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
                height: 2.h,
                width: double.infinity,
                color: Colors.white,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(24.w),
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  children: [
                    ...List.generate(
                      10,
                          (index) => GestureDetector(
                        onTap: () {
                          c = index;
                          setState((){

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.r)),
                              color: c == index ? AppColor.itemColor : const Color(0xFF272727)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(AppImages.flag),
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppImages.fontLato,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        catefory.call(1);
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 150.w,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: AppColor.itemColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppImages.fontLato),
                            ),
                          ))),
                  GestureDetector(
                      onTap: () {
                        catefory.call(5);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4.r)),
                              color: AppColor.itemColor),
                          width: 150.w,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppImages.fontLato),
                            ),
                          )))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      );
    }
    ),
  );
}
