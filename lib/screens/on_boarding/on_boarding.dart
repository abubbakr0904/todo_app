import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/bottom_navigation/navigator.dart';
import 'package:todo_app/screens/home_screen/home_screen.dart';
import 'package:todo_app/utils/color/color.dart';
import 'package:todo_app/utils/images/images.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int c = 0;
  PageController cont = PageController();
  List<String> images = [AppImages.page1, AppImages.page2, AppImages.page3];
  List<String> bigTxt = [
    "Manage your tasks",
    "Create daily routine",
    "Orgonaize your tasks"
  ];
  List<String> littleText = [
    "You can easily manage all of your daily tasks in DoMe for free ",
    "In Uptodo  you can create your personalized routine to stay productive",
    "You can organize your daily tasks by adding your tasks into separate categories"
  ];

  @override
  Widget build(BuildContext context) {
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Way1()));
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppImages.fontLato),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(width: 10.w,)
              ],
            ),
            SizedBox(
              height: 300,
              child: PageView(
                controller: cont,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(
                    3,
                    (index) => Image.asset(
                      images[index],
                      width: pw,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: pw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    width: 26.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60.r)),
                      color: c == 0 ? AppColor.itemColor : Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    width: 26.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60.r)),
                      color: c == 1 ? AppColor.itemColor : Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.w),
                    width: 26.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60.r)),
                      color: c == 2 ? AppColor.itemColor : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              bigTxt[c],
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppImages.fontLato,
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              littleText[c],
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppImages.fontLato,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if(c > 0){
                      setState(() {
                        c--;
                      });
                      cont.jumpToPage(c);
                    }
                    
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 24.w),
                    child: Text(
                      "BACK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppImages.fontLato),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(c != 2){
                      setState(() {
                        c++;
                      });
                      cont.jumpToPage(c);
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Way1()));
                    }

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 24.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.r)
                      ),
                      color : AppColor.itemColor
                    ),
                    child: Text(
                      c != 2 ? "NEXT" : "GET STARTED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppImages.fontLato),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: AppColor.activeColor,
    );
  }
}
