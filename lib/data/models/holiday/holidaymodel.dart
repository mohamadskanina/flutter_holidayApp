import 'package:json_annotation/json_annotation.dart';

part 'holidaymodel.g.dart';

@JsonSerializable()
class HolidaysModel {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  List<String>? counties;
  int? launchYear;
  String? type;

  HolidaysModel(
      {this.date,
      this.localName,
      this.name,
      this.countryCode,
      this.fixed,
      this.global,
      this.counties,
      this.launchYear,
      this.type});

  factory HolidaysModel.fromJson(Map<String, dynamic> json) =>
      _$HolidaysModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidaysModelToJson(this);
}
