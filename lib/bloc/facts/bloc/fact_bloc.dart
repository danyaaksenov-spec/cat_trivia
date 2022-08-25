import 'package:bloc/bloc.dart';
import 'package:cat_trivia/data/facts/fact_repository.dart';
import 'package:cat_trivia/data/facts/remote/response/facts.dart';
import 'package:equatable/equatable.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final FactRepository repository;
  FactBloc(this.repository) : super(FactInitState()) {
    on<LoadFactEvent>((event, emit) async {
      emit(FactLoadingState());
      try {
        var fact = await repository.getFact();
        if (fact.fact.isEmpty) {
          emit(FactNoDataState('Fact not found'));
        } else {
          emit(FactLoadedState(model: fact));
        }
      } catch (_) {
        emit(FactErrorState(errorMessage: 'Something went wrong'));
      }
    });
  }
}
