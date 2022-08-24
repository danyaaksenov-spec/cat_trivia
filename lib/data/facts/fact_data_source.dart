import 'package:cat_trivia/data/facts/remote/response/facts.dart';

abstract class FactDataSource {
  Future<FactModel> getFact();
}
