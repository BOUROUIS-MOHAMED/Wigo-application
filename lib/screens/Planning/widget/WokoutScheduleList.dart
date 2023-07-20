import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigo/screens/planning/model/WorkoutScheduleListModel.dart';
import 'package:wigo/utils/colors.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return SliverList(
                delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
            return Container(
                    padding: EdgeInsets.only(left:0, right: 0.w),
            margin: EdgeInsets.only(bottom: WorkoutScheduleListModelItems.loadItems(context)[index].type == null ? 33.h : 22.h),
            child:
            WorkoutScheduleListModelItems.loadItems(context)[index].timestamp == "12:00"?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height:60.w,

                      width:0.8.sw,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_done,
                            color: Color(0xff262626),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "We Complete the previous",
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Color(0xff262626),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: WorkoutScheduleListModelItems.loadItems(context)[index].type == null
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(WorkoutScheduleListModelItems.loadItems(context)[index].timestamp),

                        Stack(
                          children: [

                            Container(
                              width: 0.6.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffF4F4F4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(
                                left: 13.w,
                                right: 15.w,
                                bottom: 10.h,
                                top: WorkoutScheduleListModelItems.loadItems(context)[index].type == null ? 10.h : 16.h,
                              ),
                              margin: EdgeInsets.only(top: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      WorkoutScheduleListModelItems.loadItems(context)[index].title,
                                      style: TextStyle(
                                        color: WorkoutScheduleListModelItems.loadItems(context)[index].type == null
                                            ? Colors.red
                                            : Color(0xff262626),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  if (WorkoutScheduleListModelItems.loadItems(context)[index].type != null)
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.0),
                                      child: Icon(Icons.more_horiz),
                                    )
                                ],
                              ),
                            ),
                            if (WorkoutScheduleListModelItems.loadItems(context)[index].type != null)
                              Container(
                                height: 16.h,
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                margin: EdgeInsets.only(left: 11),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff262626),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Event type",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8.sp,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ):
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: WorkoutScheduleListModelItems.loadItems(context)[index].type == null
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                    children: [
            Text(WorkoutScheduleListModelItems.loadItems(context)[index].timestamp),

                    Stack(
                            children: [

            Container(
                    width: 0.6.sw,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF4F4F4),
                    boxShadow: [
            BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
            padding: EdgeInsets.only(
                    left: 13.w,
                    right: 15.w,
                    bottom: 10.h,
                    top: WorkoutScheduleListModelItems.loadItems(context)[index].type == null ? 10.h : 16.h,
                      ),
            margin: EdgeInsets.only(top: 8.h),
            child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Expanded(
                    child: Text(
                      WorkoutScheduleListModelItems.loadItems(context)[index].title,
                    style: TextStyle(
                    color: WorkoutScheduleListModelItems.loadItems(context)[index].type == null
                    ? Colors.red
                    : Color(0xff262626),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                              ),
                            ),
                          ),
            if (WorkoutScheduleListModelItems.loadItems(context)[index].type != null)
                Padding(
                        padding: EdgeInsets.only(left: 2.0),
            child: Icon(Icons.more_horiz),
                            )
                        ],
                      ),
                    ),
            if (WorkoutScheduleListModelItems.loadItems(context)[index].type != null)
                Container(
                        height: 16.h,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
            margin: EdgeInsets.only(left: 11),
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff262626),
                        ),
            alignment: Alignment.center,
                    child: Text(
                    "Event type",
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 8.sp,
                    height: 1.3,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
        childCount: WorkoutScheduleListModelItems.loadItems(context).length,
      ),

    );
    }
}