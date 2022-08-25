import 'package:cat_trivia/bloc/history/history_bloc.dart';
import 'package:cat_trivia/common/app_colors.dart';
import 'package:cat_trivia/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      if (state is HistoryLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is HistoryLoadedState) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.appBar,
            title: const Text(
              AppStrings.appBarHistory,
              style: TextStyle(color: Colors.black87),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: state.models.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text(state.models[index].fact),
                  subtitle: Text(DateFormat('yMMMd')
                      .add_Hm()
                      .format(state.models[index].createdAt)),
                ),
              );
            }),
          ),
        );
      }

      if (state is HistoryErrorState) {
        return const Center(
          child: Text('Error'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
