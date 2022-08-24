import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response/facts.dart';

part 'fact_api_client.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class FactApiClient {
  factory FactApiClient(Dio dio, {String baseUrl}) = _FactApiClient;

  @GET("/fact")
  Future<FactModel> getFact();
}
