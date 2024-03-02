import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/model/category_model/category_model.dart';
import 'package:todo_app/screens/data.dart';
import 'package:todo_app/screens/home_screen/widget/home_screen_widget.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

import '../../data/lcoal/local_database/category_local.dart';
import '../../data/lcoal/local_database/local.dart';
import '../../data/model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskModel taskModel = TaskModel.initialValue;
  CategoryModel categoryModel = CategoryModel.initialValue;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    _init();
    print("Nimadur");
    setState(() {

    });
    super.initState();
  }

  List<TaskModel> tasks = [];
  List<CategoryModel> categories = [];

  _init() async {
    tasks = await LocalDatabase.getAllTasks();
    categories = await LocalDatabase.getAllModel();
    print("leyantak : ${categories.length}");
    setState(() {

    });
    }



  int c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImages.burger),
                  Text(
                    "Index",
                    style: TextStyle(
                        color: Color(int.parse("0xFFFFFFFF")),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppImages.fontLato),
                  ),
                  Image.asset(
                    AppImages.profilePhoto,
                    width: 42.w,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            ...List.generate(
              tasks.length,
              (index) => GestureDetector(
                  onTap: () {
                    c = index;
                    setState(() {});
                  },
                  child: WidgetsHome.getCard(
                      title: tasks[index].title,
                      date: tasks[index].deadline,
                      categoryIcon: tasks[index].categoryIcon,
                      categoyName: tasks[index].category,
                      flagNum: tasks[index].priority,
                      minute: tasks[index].deadline.minute,
                      hour: tasks[index].deadline.hour,
                      color: tasks[index].categoryColor,
                      colr: c == index,
                      id: tasks[index].id!,
                    yangi: (){
                        setState(() {

                        });
                    }
                  )),
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}
