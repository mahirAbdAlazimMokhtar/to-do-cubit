import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import '../../../../../core/widgets/build_task_widget.dart';
import '../add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
         margin: EdgeInsets.only(bottom: 24.0.h),
          padding:  const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
               SizedBox(height: 12.0.h),
              Text(
                AppString.toDay,
                style: Theme.of(context).textTheme.displayLarge,
              ),
               SizedBox(height: 10.0.h),

              SizedBox(
                height: 85.h,
                //width: double.infinity,
                child: DatePicker(
                  DateTime.now(),
                  onDateChange: (date) {},
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 15.sp),
                  initialSelectedDate: DateTime.now(),
                  selectedTextColor: AppColors.white,
                  selectionColor: AppColors.primary,
                ),
              ),
               SizedBox(height: 24.0.h),
              //NoTaskWidget(),
              const BuildTaskWidget(),

              const BuildTaskWidget(),

              SizedBox(height: 24.0.h),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>   AddTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
