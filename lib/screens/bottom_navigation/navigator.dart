import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/screens/calendar_screen/calendar_screen.dart';
import 'package:todo_app/screens/focuse_screen/focuse_screen.dart';
import 'package:todo_app/screens/home_screen/home_screen.dart';
import 'package:todo_app/screens/home_screen/widget/task_title_dialog.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/utils/color/color.dart';

import '../../utils/images/images.dart';

class Way1 extends StatefulWidget {
  const Way1({super.key});

  @override
  State<Way1> createState() => _Way1State();
}

class _Way1State extends State<Way1> {
  List<Widget> _screens = [];
  int _currentIndex = 0;
  TaskModel taskModel = TaskModel.initialValue;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const Calendar(),
      const Focuse(),
      const Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.activeColor,
        onTap: (v) {
          setState(() {
            _currentIndex = v;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF585858),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.home,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppImages.home,
              color: const Color(0xFF8D8D8D),
            ),
            label: "Index",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.calendar,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AppImages.calendar,
                color: const Color(0xFF8D8D8D)),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.clock,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppImages.clock,
              color: const Color(0xFF8D8D8D),
            ),
            label: "Focuse",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.profile,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(AppImages.profile,
                color: const Color(0xFF8D8D8D)),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.itemColor,
          onPressed: () {
            textFieldDialog(
                context: context,
                taskModel: (task) {
                  taskModel = task;
                },
                description: (description) {
                  taskModel.copyWith(description: description);
                },
            );

          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.r))),
          child: SvgPicture.asset(AppImages.plus)),
    );
  }
}
