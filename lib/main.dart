import 'package:cat_trivia/bloc/history/history_bloc.dart';
import 'package:cat_trivia/data/cats/cat_repository.dart';
import 'package:cat_trivia/data/facts/fact_repository.dart';
import 'package:cat_trivia/ui/pages/history_page.dart';
import 'package:cat_trivia/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/cats/bloc/cat_bloc.dart';
import 'bloc/facts/bloc/fact_bloc.dart';
import 'data/facts/local/fact_hive_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FactHiveModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HistoryBloc(FactRepository())..add(LoadHistoryEvent())),
        BlocProvider<FactBloc>(
          create: (context) => FactBloc(FactRepository())
            ..add(
              LoadFactEvent(),
            ),
        ),
        BlocProvider<CatBloc>(
          create: (context) => CatBloc(CatRepository())..add(CatLoadEvent()),
        ),
      ],
      child: MaterialApp(
          initialRoute: '/mainPage',
          routes: {
            '/mainPage': (context) => const HomePage(),
            '/historyPage': (context) => const HistoryPage(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Cat Trivia',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}
