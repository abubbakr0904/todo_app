import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/model/category_model/category_model.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/screens/add_category/add_category.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

import '../../../data/lcoal/local_database/local.dart';

openCategory(
    {required BuildContext context,
    required ValueChanged<String> category,
    required ValueChanged<String> icon,
    required ValueChanged<Color> color}) async {
  int selectedCategory = 0;
  TaskModel taskModel = TaskModel.initialValue;
  CategoryModel catModel = CategoryModel.initialValue;

  List<CategoryModel> categories = [];

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      _init() async {
        categories = await LocalDatabase.getAllModel();
        print(categories.length);
      }

      setState(() {
        _init();
      });
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
                  childAspectRatio: 0.8,
                  padding: EdgeInsets.all(24.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                      onTap: () {
                        selectedCategory = index;
                        if (selectedCategory == categories.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCategory(clr: (v) {
                                catModel = catModel.copyWith(color: v);
                                setState(() {});
                              }, icon: (v) {
                                catModel = catModel.copyWith(icon: v);
                                setState(() {});
                              }, text: (ct) {
                                catModel = catModel.copyWith(category: ct);
                                setState(() {
                                  categories = [];
                                });
                              },
                              arguments: (c)async{
                                categories = await LocalDatabase.getAllModel();
                                setState((){

                                });
                              },),
                            ),

                          );
                          LocalDatabase.insertCategory(catModel);
                        }
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 64.w,
                              height: 64.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: selectedCategory == index
                                    ? categories[index].color
                                    : categories[index].color.withOpacity(0.7),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    categories[index].icon,
                                    width: 32.w,
                                    height: 32.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              categories[index].category,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppImages.fontLato,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCategory(clr: (v) {
                          catModel = catModel.copyWith(color: v);
                        }, icon: (v) {
                          catModel = catModel.copyWith(icon: v);
                        }, text: (ct) {
                          catModel = catModel.copyWith(category: ct);
                        }, arguments: (c)async{
                            categories = await LocalDatabase.getAllModel();
                            setState((){

                            });
                        },

                        ),
                      ),
                    );
                    LocalDatabase.insertCategory(catModel);
                    setState(() {});
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: AppColor.itemColor),
                  child: Text(
                    "New Category",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontLato),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  color.call(categories[selectedCategory].color);
                  category.call(categories[selectedCategory].category);
                  icon.call(categories[selectedCategory].icon);
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
