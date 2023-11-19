import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text(AppString.addTask,style: Theme.of(context).textTheme.displayLarge,),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(onPressed: (){},
        icon: const Icon(Icons.arrow_back_ios)),
        ),


      body: Center(
        child: Text('Add Task'),
      ),
    );
  }
}
