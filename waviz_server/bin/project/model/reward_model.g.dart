// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardItemModel _$RewardItemModelFromJson(Map<String, dynamic> json) =>
    _RewardItemModel(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageRaw:
          (json['image_raw'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RewardItemModelToJson(_RewardItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'image_raw': instance.imageRaw,
    };
