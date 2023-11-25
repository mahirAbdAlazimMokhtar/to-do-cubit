import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/feature/task/cubit/task_state.dart';




class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

  int currentIndex = 0;

  getDate(context) async{
    emit(LoadingStartTime());
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      BlocProvider.of<TaskCubit>(context).currentDate = pickedDate!;
      emit(LoadedStartTime());
    } else {
      print('No date selected');
    }
  }

  getStartTime(context) async{
    emit(LoadingDate());
    TimeOfDay? pickedStartTime =
    await showTimePicker(
      context: context,
      initialTime:
      TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      BlocProvider.of<TaskCubit>(context)
          .startTime =
          pickedStartTime.format(context);
      emit(LoadedDate());
    } else {
      print('No time selected');
    }
  }
  getEndTime(context) async {
    emit(LoadingEndTime());
    TimeOfDay? pickedStartTime =
    await showTimePicker(
      context: context,
      initialTime:
      TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      BlocProvider.of<TaskCubit>(context).endTime =
          pickedStartTime.format(context);
      emit(LoadedEndTime());
    } else {
      print(BlocProvider.of<TaskCubit>(context)
          .endTime);
    }
  }
void changeIndexOfColor(int index) {
    currentIndex = index;
    emit(LoadedColor());

}

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
}
