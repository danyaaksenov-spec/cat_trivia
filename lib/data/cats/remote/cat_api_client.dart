import 'package:cat_trivia/data/cats/remote/response/cats.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_api_client.g.dart';

@RestApi(baseUrl: "https://cataas.com/")
abstract class CatApiClient {
  factory CatApiClient(Dio dio, {String baseUrl}) = _CatApiClient;

  @GET("cat?json=true")
  Future<CatModel> getCat();
}
