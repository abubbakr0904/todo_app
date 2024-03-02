import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/lcoal/local_database/local.dart';

import '../../../utils/color/color.dart';
import '../../../utils/images/images.dart';

class WidgetsHome{
  static Widget getCard({
    required  String title,
    required DateTime date,
    required String categoryIcon,
    required String categoyName,
    required int flagNum,
    required int minute,
    required int hour,
    required int color,
    required bool colr,
    required int id,
    required VoidCallback yangi,
}){
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: (c){
                LocalDatabase.deleteTask(id);
                yangi.call();
              },
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Archive',
            ),
            SlidableAction(
              onPressed: (c){},
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
            ),
          ],
        ),
        child : Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(4.r)
                ),
                color : const Color(0xFF363636)
            ),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width : 5.w),
                    GestureDetector(
                      onTap: (){

                        },
                      child: Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.r),
                            border: Border.all(
                                width: 1,
                                color: AppColor.itemColor
                            ),
                            color :  colr ? AppColor.itemColor : Colors.transparent

                        ),
                      ),
                    ),
                    SizedBox(width : 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title , style: TextStyle(
                            color : Colors.white,
                            fontSize: 16.sp,
                            fontFamily: AppImages.fontLato,
                            fontWeight: FontWeight.w400
                        ),),
                        Row(
                          children: [
                            Text(DateFormat.yMMMEd().format(date as DateTime) , style: TextStyle(
                                color : Colors.white,
                                fontSize: 13.sp,
                                fontFamily: AppImages.fontLato,
                                fontWeight: FontWeight.w400
                            ),),
                            Text("  ${hour} : ${minute}" , style: TextStyle(
                                color : const Color(0xFFAFAFAF),
                                fontSize: 14.sp,
                                fontFamily: AppImages.fontLato,
                                fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Container(
                            padding : EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color : Color(color as int)
                            ),
                            child : Row(
                              children: [
                                SvgPicture.asset(categoryIcon ,  width: 14.w,fit : BoxFit.cover),
                                Text(categoyName , style: TextStyle(
                                    color : Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: AppImages.fontLato,
                                    fontWeight: FontWeight.w400
                                ),),
                              ],
                            )
                        ),
                        SizedBox(width: 8.w,),
                        Container(
                            padding : EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    width: 1,
                                    color: AppColor.itemColor
                                ),
                                color : Colors.transparent
                            ),
                            child : Row(
                              children: [
                                SvgPicture.asset(AppImages.flag , width: 14.w, fit : BoxFit.cover),
                                Text(flagNum.toString() , style: TextStyle(
                                    color : Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: AppImages.fontLato,
                                    fontWeight: FontWeight.w400
                                ),),
                              ],
                            )
                        ),

                      ],
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}