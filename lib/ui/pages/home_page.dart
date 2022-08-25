import 'package:cat_trivia/bloc/facts/bloc/fact_bloc.dart';
import 'package:cat_trivia/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/cats/bloc/cat_bloc.dart';
import '../widgets/facts_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (context, state) {
        if (state is FactLoadingState) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        }

        if (state is FactLoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.only(top: 12, bottom: 10),
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...factsCard('Awesome fact: ', state.model.fact),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...factsCard(
                                "Created at:",
                                DateFormat.Hm().add_MMMMd().format(now),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<CatBloc, CatState>(
                  builder: (context, state) {
                    if (state is CatLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CatLoadedState) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage("https://cataas.com" +
                                  "${state.catModel.url}"),
                              fit: BoxFit.cover),
                        ),
                      );
                    }
                    if (state is CatErrorState) {
                      return const Center(
                        child: Text('Error during getting cat photo'),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.appBar.withOpacity(0.5),
                        content: const Text(
                          'Updating cat\'s photo and fact... :)',
                          style: TextStyle(color: Colors.black87),
                        )));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 15,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.appBar,
                        border: Border.all(width: 1.7, color: Colors.black38),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Another fact!',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is FactNoDataState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        if (state is FactErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
