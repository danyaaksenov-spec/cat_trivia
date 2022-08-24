import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://catfact.ninja/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/fact")
  Future<List<FactModel>> getFacts();
}

@JsonSerializable()
class FactModel {
  String fact;
  int length;

  FactModel({required this.fact, required this.length});

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);
  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
