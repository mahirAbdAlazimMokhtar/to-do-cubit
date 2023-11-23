import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/feature/task/presentation/components/add_task_component.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController startController = TextEditingController();

  TextEditingController endController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

  int currentIndex=0;

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //title
          AddTaskComponent(
              title: AppString.title,
              hintTitle: AppString.titleHint,
              controller: titleController),
          const SizedBox(height: 16),
          //note
          AddTaskComponent(
            title: AppString.note,
            hintTitle: AppString.noteHint,
            controller: noteController,
          ),
          //Date
          const SizedBox(height: 16),
          AddTaskComponent(
            readOnly: true,
            title: AppString.date,
            hintTitle: DateFormat.yMd().format(currentDate),
            //controller: dateController,
            icon: IconButton(
              icon: const Icon(Icons.calendar_month_sharp),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                setState(() {
                  if (pickedDate != null) {
                    currentDate = pickedDate!;
                  } else {
                    print('No date selected');
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AddTaskComponent(
                  title: AppString.startDate,
                  readOnly: true,
                  hintTitle: startTime,
                  //controller: startController,
                  icon: IconButton(
                    icon: const Icon(Icons.timer_outlined),
                    onPressed: () async {
                      TimeOfDay? pickedStartTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );

                      if (pickedStartTime != null) {
                        setState(() {
                          startTime = pickedStartTime.format(context);
                        });
                      } else {
                        print('No time selected');
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AddTaskComponent(
                  title: AppString.endDate,
                  readOnly: true,
                  hintTitle: endTime,
                  //controller: startController,
                  icon: IconButton(
                    icon: const Icon(Icons.timer_outlined),
                    onPressed: () async {
                      TimeOfDay? pickedStartTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );

                      if (pickedStartTime != null) {
                        setState(() {
                          endTime = pickedStartTime.format(context);
                        });
                      } else {
                        print(endTime);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          //! Color Widget
          Expanded(
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
                      Color getColor(int index) {
                        switch (index) {
                          case 0:
                            return Colors.red;
                          case 1:
                            return Colors.orange;
                          case 2:
                            return Colors.yellow;
                          case 3:
                            return Colors.green;
                          case 4:
                            return Colors.blue;
                          case 5:
                            return Colors.purple;

                          default:
                            return Colors.grey;
                        }
                      }

                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: getColor(index),
                          child:index==currentIndex? const Icon(Icons.check,color: Colors.white,):null,
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
          const Spacer(),
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
          const SizedBox(height: 16),
          //Start Date
        ]),
      ),
    );
  }
}
