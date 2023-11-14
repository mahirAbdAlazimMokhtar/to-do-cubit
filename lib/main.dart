import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/cache_helper.dart';

import 'app/app.dart';
import 'core/Service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  runApp(const MyApp());
}
