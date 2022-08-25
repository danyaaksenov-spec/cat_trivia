import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cat_trivia/data/facts/fact_repository.dart';

import '../../data/facts/local/fact_hive_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final FactRepository repository;
  HistoryBloc(
    this.repository,
  ) : super(HistoryInitialState()) {
    on<LoadHistoryEvent>((event, emit) async {
      emit(HistoryInitialState());
      try {
        final List<FactHiveModel> facts =
            await repository.getAllFactsFromLocal();
        if (facts.isEmpty) {
          emit(const HistoryErrorState(messege: "List is empty"));
        } else {
          emit(HistoryLoadedState(models: facts));
        }
      } catch (_) {
        emit(const HistoryErrorState(messege: "Something went wrong"));
      }
    });
  }
}
