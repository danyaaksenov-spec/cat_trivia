import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_trivia/data/cats/remote/response/cats.dart';
import 'package:equatable/equatable.dart';

import '../../../data/cats/cat_repository.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository repository;
  CatBloc(this.repository) : super(CatInitState()) {
    on<CatLoadEvent>((event, emit) async {
      try {
        emit(CatLoadingState());
        var cat = await repository.getCat();
        if (cat.url.isEmpty) {
          emit(const CatErrorState(messege: "Error"));
        } else {
          emit(CatLoadedState(catModel: cat));
        }
      } catch (_) {
        emit(const CatErrorState(messege: 'Something went wrong'));
      }
    });
  }
}
