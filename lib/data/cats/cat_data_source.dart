import 'package:cat_trivia/data/cats/remote/response/cats.dart';

abstract class CatDataSource {
  Future<CatModel> getCat();
}
