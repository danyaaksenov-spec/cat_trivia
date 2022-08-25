import 'package:cat_trivia/data/cats/cat_repository.dart';
import 'package:cat_trivia/data/facts/fact_repository.dart';
import 'package:cat_trivia/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cats/bloc/cat_bloc.dart';
import 'bloc/facts/bloc/fact_bloc.dart';
import 'common/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FactBloc>(
          create: (context) => FactBloc(FactRepository())..add(LoadFactEvent()),
        ),
        BlocProvider<CatBloc>(
          create: (context) => CatBloc(CatRepository())..add(CatLoadEvent()),
        ),
      ],
      child: MaterialApp(

          //routes: {},
          debugShowCheckedModeBanner: false,
          title: 'Cat Trivia',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.appBar,
              centerTitle: true,
              title: Text('Cat Trivia',
                  style: TextStyle(
                      color: Colors.black87.withOpacity(0.8), fontSize: 20)),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.history_outlined,
                      color: Colors.black87,
                      size: 30,
                      semanticLabel: 'Fact history',
                    )), //button facts history
              ],
            ),
            body: HomePage(),
          )),
    );
  }
}
