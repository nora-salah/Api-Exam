
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/api_cubit.dart';
import '../home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit()..getData(),

      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}
//baseurl: https://api.thecatapi.com/v1/images/search?
// Queres: limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee