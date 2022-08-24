import 'package:cat_trivia/data/facts/fact_repository.dart';
import 'package:cat_trivia/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/facts/bloc/fact_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactBloc>(
      create: (context) => FactBloc(FactRepository()),
      child: MaterialApp(
        //routes: {},
        debugShowCheckedModeBanner: false,
        title: 'Cat Trivia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
