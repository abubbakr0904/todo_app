import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/home_screen/widget/category_select_dialog.dart';
import 'package:todo_app/screens/home_screen/widget/category_with_color.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

import '../../../data/lcoal/local_database/local.dart';
import '../../../data/model/task_model.dart';

textFieldDialog({required BuildContext context,
  required ValueChanged<TaskModel> taskModel,
  required ValueChanged<String> description,}) {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  TaskModel taskModel = TaskModel.initialValue;

  int priority = 0;
  String categgory = "";
  int clr = 0;
  String iccon = "";

  final TextEditingController cont = TextEditingController();
  final TextEditingController cont1 = TextEditingController();

  final FocusNode fcsNode = FocusNode();
  final FocusNode fcsNode1 = FocusNode();

  showModalBottomSheet(
    backgroundColor: AppColor.activeColor,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        List<TaskModel> tasks = [];
        _init() async {
          tasks = await LocalDatabase.getAllTasks();
          print("UPDATING UI");
          setState(() {});
        }

        bool popi = false;
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontLato),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.backup_outlined,
                              color: popi == true
                                  ? Colors.white
                                  : Colors.transparent)),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  SizedBox(
                    height: 43.h,
                    child: TextField(
                      onChanged: (v) {
                        taskModel = taskModel.copyWith(title: v);
                      },
                      textInputAction: TextInputAction.next,
                      focusNode: fcsNode,
                      controller: cont,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppImages.fontLato,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: AppImages.fontLato,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Do math homework",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.r)),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.r)),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  SizedBox(
                    height: 43.h,
                    child: TextField(
                      onChanged: (v) {
                        taskModel = taskModel.copyWith(description: v);
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: fcsNode1,
                      controller: cont1,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppImages.fontLato,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: AppImages.fontLato,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Description",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.r)),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.r)),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              dateTime = await showDatePicker(
                                barrierDismissible: false,
                                cancelText: "Cancel",
                                confirmText: "Choose time",
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (dateTime != null) {
                                taskModel =
                                    taskModel.copyWith(deadline: dateTime);
                                timeOfDay = await showTimePicker(
                                    initialEntryMode: TimePickerEntryMode.input,
                                    context: context,
                                    initialTime: TimeOfDay(hour: 8, minute: 0));
                                builder:
                                    (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  );
                                };
                                if (timeOfDay != null) {
                                  DateTime d = taskModel.deadline;
                                  d = d.copyWith(
                                      hour: timeOfDay!.hour,
                                      minute: timeOfDay!.minute);
                                  taskModel = taskModel.copyWith(deadline: d);
                                }
                                setState(() {});
                              }
                            },
                            icon: SvgPicture.asset(AppImages.clockDialog),
                          ),
                          IconButton(
                            onPressed: () {
                              openCategory(context: context,
                                  category: (value){
                                    taskModel  = taskModel.copyWith(category: value);
                                  },
                                  icon: (value){
                                    taskModel = taskModel.copyWith(categoryIcon: value);
                                  },
                                  color: (value){
                                    taskModel = taskModel.copyWith(categoryColor: value);
                                  }
                              );
                            },
                            icon: SvgPicture.asset(AppImages.sale),
                          ),
                          IconButton(
                            onPressed: () {
                              showCategory(
                                  context: context,
                                  catefory: (a) {
                                    taskModel = taskModel.copyWith(priority: a);
                                  });
                            },
                            icon: SvgPicture.asset(AppImages.flag),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          fcsNode.unfocus();
                          if (timeOfDay != null &&
                              dateTime != null &&
                              cont1.text.isNotEmpty &&
                              cont.text.isNotEmpty) {
                            await LocalDatabase.insertTask(taskModel);
                            _init();
                            Navigator.pop(context);
                            popi = true;
                            print(taskModel.getString());
                            setState(() {});
                            _showToast(context, "Saved", Colors.green);

                          } else {
                            _showToast(context, "Error", Colors.red);
                          }
                        },
                        icon: SvgPicture.asset(AppImages.send),
                      ),
                    ],
                  ),
                  if (timeOfDay != null)
                    Row(
                      children: [
                        Text(
                          "TIME: ",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                        Text(
                          "${timeOfDay!.hour}:${timeOfDay!.minute}",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  if (dateTime != null)
                    Row(
                      children: [
                        Text(
                          "DEADLINE: ",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(dateTime!),
                          style:
                          TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

void _showToast(BuildContext context, String txt, Color clr) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: clr,
      textColor: Colors.white,
      fontSize: 16.0) as SnackBar);
}
