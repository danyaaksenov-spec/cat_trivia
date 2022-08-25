part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitState extends CatState {}

class CatLoadingState extends CatState {}

class CatLoadedState extends CatState {
  final CatModel catModel;
  const CatLoadedState({
    required this.catModel,
  });
}

class CatErrorState extends CatState {
  final String messege;
  const CatErrorState({
    required this.messege,
  });

  @override
  List<Object> get props => [messege];

  @override
  String toString() => 'Fact Failure --> message: $messege';
}
