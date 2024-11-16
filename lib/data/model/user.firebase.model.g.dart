// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.firebase.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFirebase _$UserFirebaseFromJson(Map<String, dynamic> json) => UserFirebase(
      name: json['name'] as String?,
      age: (json['age'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserFirebaseToJson(UserFirebase instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
