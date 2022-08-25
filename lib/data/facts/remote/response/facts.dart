import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facts.g.dart';

@JsonSerializable()
class FactModel extends Equatable {
  @override
  List<Object?> get props => [];

  final String fact;

  const FactModel({required this.fact});

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);
  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
