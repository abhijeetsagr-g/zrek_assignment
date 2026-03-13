import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrek_assignment/core/config/app_theme.dart';
import 'package:zrek_assignment/logic/bloc/feed/feed_bloc.dart';
import 'package:zrek_assignment/ui/home/home_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => FeedBloc()..add(FeedStarted()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      home: HomeView(),
    );
  }
}
