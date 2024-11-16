import 'package:json_annotation/json_annotation.dart';
part 'user.firebase.model.g.dart';

@JsonSerializable()
class UserFirebase {
  final String? name;
  final int? age;
  factory UserFirebase.fromJson(Map<String, dynamic> json) =>
      _$UserFirebaseFromJson(json);
  UserFirebase({this.name, this.age});
  Map<String, dynamic> toJson() => _$UserFirebaseToJson(this);
}
