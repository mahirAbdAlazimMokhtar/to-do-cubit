import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/Bloc/bloc_observer.dart';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/feature/task/cubit/task_cubit.dart';

import 'app/app.dart';
import 'core/Service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await sl<CacheHelper>().init();
  runApp(
    BlocProvider(
      create: (context) => TaskCubit(),
      child: const MyApp(),
    ),
  );
}
