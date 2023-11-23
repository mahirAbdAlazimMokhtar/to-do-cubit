import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 14.0),
              Text(
                AppString.toDay,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10.0),
              DatePicker(
                DateTime.now(),
                onDateChange: (date) {},
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: AppColors.white,
                selectionColor: AppColors.primary,
              ),
              const SizedBox(height: 24.0),
              //NoTaskWidget(),
              const BuildTaskWidget(),

              const BuildTaskWidget(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  AddTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
