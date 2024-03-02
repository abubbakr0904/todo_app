import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/screens/add_category/icons.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class AddCategory extends StatefulWidget {
  const AddCategory(
      {super.key, required this.clr, required this.icon, required this.text, required this.arguments});

  final ValueChanged<Color> clr;
  final ValueChanged<String> icon;
  final ValueChanged<String> text;
  final ValueChanged arguments;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController cont = TextEditingController();
  bool img = false;
  String iconss = AppImages.home;
  int cl = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Text(
                "Create new category",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Category name :",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextField(
                  controller: cont,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppImages.fontLato),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.w),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color(0xFF979797),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color(0xFF979797),
                      ),
                    ),
                    hintText: "Category name",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppImages.fontLato),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Category icon :",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  openCategoryIcon(
                    context: context,
                    icon: (value) {
                      iconss = value;
                      setState(() {});
                    },
                  );
                  setState(() {
                    img = true;
                  });
                },
                child: Container(
                    height: 38.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        color: img ? Color(cl) : Colors.white.withOpacity(0.2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        img
                            ? SvgPicture.asset(iconss, color: Colors.white)
                            : Text(
                                "Choose icon from library",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppImages.fontLato,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp),
                              )
                      ],
                    )),
              ),
              SizedBox(height: 20.h),
              Text(
                "Category color :",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppImages.fontLato),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        clrs.length,
                        (index) => GestureDetector(
                            onTap: () {
                              cl = clrs[index];
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 24.w),
                              width: 36.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60.r)),
                                  color: Color(clrs[index])),
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: 220.h,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          width: 150.w,
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
                        if(cont.text.isNotEmpty && cl != 0){
                          widget.icon.call(iconss);
                          widget.text.call(cont.text);
                          widget.clr.call(Color(cl));
                          Navigator.pop(context);
                          _showToast(context, "Saved", Colors.green);

                        }
                        else{
                          _showToast(context, "Information is wrong", Colors.red);
                        }

                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              color: AppColor.itemColor),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          width: 150.w,
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: AppImages.fontLato),
                            ),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}

List<int> clrs = [
  0xFFC9CC41,
  0xFF66CC41,
  0xFF41CCA7,
  0xFF4181CC,
  0xFF41A2CC,
  0xFFCC8441,
  0xFFCC8441,
  0xFFCC4173,
  0xFFC9CC41,
  0xFF66CC41,
  0xFF41CCA7,
  0xFF4181CC,
  0xFF41A2CC,
  0xFFCC8441,
  0xFFCC8441,
  0xFFCC4173,
];

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
