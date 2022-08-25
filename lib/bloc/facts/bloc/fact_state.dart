part of 'fact_bloc.dart';

abstract class FactState extends Equatable {
  const FactState();

  @override
  List<Object> get props => [];
}

class FactInitState extends FactState {}

class FactLoadingState extends FactState {}

class FactLoadedState extends FactState {
  FactModel model;

  FactLoadedState({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

class FactNoDataState extends FactState {
  final String message;

  FactNoDataState(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'No data (message : $message)';
}

class FactErrorState extends FactState {
  final String errorMessage;
  FactErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Fact Failure --> message: $errorMessage';
}
