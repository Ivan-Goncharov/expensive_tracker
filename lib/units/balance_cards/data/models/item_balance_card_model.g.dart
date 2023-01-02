// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'item_balance_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemBalanceCard _$$_ItemBalanceCardFromJson(Map<String, dynamic> json) =>
    _$_ItemBalanceCard(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ItemBalanceCardToJson(_$_ItemBalanceCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
    };
