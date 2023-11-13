import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/cache_helper.dart';

import 'app/app.dart';

void main() async{
  CacheHelper().init();
  runApp(const MyApp());
}


