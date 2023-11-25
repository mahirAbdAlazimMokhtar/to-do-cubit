import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/feature/task/cubit/task_cubit.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_component.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../cubit/task_state.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController startController = TextEditingController();

  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    AddTaskComponent(
                        title: AppString.title,
                        hintTitle: AppString.titleHint,
                        controller: titleController),
                    SizedBox(height: 16.h),
                    //note
                    AddTaskComponent(
                      title: AppString.note,
                      hintTitle: AppString.noteHint,
                      controller: noteController,
                    ),
                    //Date
                    SizedBox(height: 16.h),
                    AddTaskComponent(
                      readOnly: true,
                      title: AppString.date,
                      hintTitle: DateFormat.yMd().format(
                          BlocProvider.of<TaskCubit>(context).currentDate),
                      //controller: dateController,
                      icon: IconButton(
                        icon: const Icon(Icons.calendar_month_sharp),
                        onPressed: () async {
                          BlocProvider.of<TaskCubit>(context).getDate(context);
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AddTaskComponent(
                            title: AppString.startDate,
                            readOnly: true,
                            hintTitle:
                                BlocProvider.of<TaskCubit>(context).startTime,
                            //controller: startController,
                            icon: IconButton(
                              icon: const Icon(Icons.timer_outlined),
                              onPressed: () async {
                               BlocProvider.of<TaskCubit>(context).getStartTime(context);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: AddTaskComponent(
                            title: AppString.endDate,
                            readOnly: true,
                            hintTitle:
                                BlocProvider.of<TaskCubit>(context).endTime,
                            //controller: startController,
                            icon: IconButton(
                              icon: const Icon(Icons.timer_outlined),
                              onPressed: () async {
                                BlocProvider.of<TaskCubit>(context).getEndTime(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    //! Color Widget
                    SizedBox(
                      height: 68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.color,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                               BlocProvider.of<TaskCubit>(context).getColor(index);

                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<TaskCubit>(context).changeIndexOfColor(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: BlocProvider.of<TaskCubit>(context).getColor(index),
                                    child: index ==
                                            BlocProvider.of<TaskCubit>(context)
                                                .currentIndex
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 6,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    //! Priority Widget
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: CustomElevatedButton(
                          title: AppString.createTask,
                          onPressed: () {
                            //TODO: Add Task
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(height: 16.h),
                    //Start Date
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
