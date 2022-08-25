import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_trivia/data/facts/fact_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/facts/local/fact_hive_model.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final FactRepository repository;

  FactBloc(this.repository) : super(FactInitState()) {
    on<LoadFactEvent>((event, emit) async {
      try {
        emit(FactLoadingState());
        var fact = await repository.getFact();
        if (fact.fact.isEmpty) {
          emit(const FactNoDataState('Fact not found'));
        } else {
          emit(FactLoadedState(model: fact));
        }
      } catch (_) {
        emit(const FactErrorState(errorMessage: 'Something went wrong'));
      }
    });
  }
}
