import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/dio/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer=MyBlocObserver();
  runApp( MyApp());
}
