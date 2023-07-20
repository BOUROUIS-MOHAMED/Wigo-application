import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wigo/screens/planning/widget/WokoutScheduleList.dart';
import 'package:intl/intl.dart';
import 'package:wigo/utils/colors.dart';
class WokoutDailyPlanificationScreen extends StatefulWidget {
  const WokoutDailyPlanificationScreen({Key? key}) : super(key: key);

  @override
  State<WokoutDailyPlanificationScreen> createState() =>
      _WokoutDailyPlanificationScreenState();
}

class _WokoutDailyPlanificationScreenState
    extends State<WokoutDailyPlanificationScreen> {
  List days = [
    DateTime.now().subtract(Duration(days: 6)),
    DateTime.now().subtract(Duration(days: 5)),
    DateTime.now().subtract(Duration(days: 4)),
    DateTime.now().subtract(Duration(days: 3)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 3)),
    DateTime.now().add(Duration(days: 4)),
    DateTime.now().add(Duration(days: 5)),
    DateTime.now().add(Duration(days: 6)),
  ];
  DateTime selectedDay=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 28.w),
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 9.h),
                  child: Text(
                    "Welcome back, Hama",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      height: 1.3,
                      color: Color(0xff262626),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                DateFormat('d, MMMM yyyy').format(selectedDay),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              height: 1.4,
                              color: Color(0xff262626),
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('EEEE').format(selectedDay),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff262626),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 80.h,
                      width: 1.sw,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 20),
                            ListView.separated(
                              itemCount: days.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10);
                              },
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
selectedDay=days[index];
                                      });
                                    },
                                    child: Container(
                                      height: 0.08.sw,
                                      width: 0.5.sw,
                                      // width: 75.h,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color:
                                        selectedDay.day!=days[index].day?
                                        Colors.grey.shade200:AppColors.darkGreen,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade50,
                                            spreadRadius: 1,
                                            blurRadius: 0,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            DateFormat('EEEE')
                                                .format(days[index]),
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.workSans()
                                                  .fontFamily,
                                              fontSize: 0.02.sh,
                                              color:  selectedDay.day==days[index].day?
                                              Colors.grey.shade200:Colors.black,

                                            ),
                                          ),
                                          Text(
                                            days[index].day.toString(),
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: GoogleFonts.workSans()
                                                  .fontFamily,
                                              color:  selectedDay.day==days[index].day?
                                              Colors.grey.shade200:Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 27.h, top: 48.h),
                  child: Text(
                    "Workout List",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Color(0xff262626),
                    ),
                  ),
                ),
              ),
              ScheduleList(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 46.w,
        width: 46.w,
        child: FloatingActionButton(
          backgroundColor: Color(0xffC4C4C4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Icon(
            Icons.add,
            color: Color(0xff161616),
          ), //child widget inside this button
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  final bool isToday;
  final String day;
  final String dayNumber;

  const _DateItem(
      {Key? key,
      required this.isToday,
      required this.day,
      required this.dayNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: Color(0xff3C3C43).withOpacity(0.3),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isToday ? Color(0xffC4C4C4) : null,
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding:
              EdgeInsets.only(left: 9.w, right: 9.w, bottom: 9.w, top: 9.w),
          margin: REdgeInsets.only(top: 5.h),
          child: Text(
            dayNumber,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: Color(0xff262626),
            ),
          ),
        ),
      ],
    );
  }
}
