import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cats.g.dart';

@JsonSerializable()
class CatModel extends Equatable {
  @override
  List<Object?> get props => [url];

  String url;

  CatModel({required this.url});

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
