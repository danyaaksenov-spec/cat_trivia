part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  final List<FactHiveModel> models;

  const HistoryLoadedState({required this.models});
}

class HistoryErrorState extends HistoryState {
  final String messege;
  const HistoryErrorState({
    required this.messege,
  });
}
