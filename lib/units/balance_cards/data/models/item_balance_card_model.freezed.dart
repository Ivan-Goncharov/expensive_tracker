// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_balance_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemBalanceCardModel _$ItemBalanceCardModelFromJson(Map<String, dynamic> json) {
  return _ItemBalanceCard.fromJson(json);
}

/// @nodoc
mixin _$ItemBalanceCardModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get currencyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemBalanceCardModelCopyWith<ItemBalanceCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemBalanceCardModelCopyWith<$Res> {
  factory $ItemBalanceCardModelCopyWith(ItemBalanceCardModel value,
          $Res Function(ItemBalanceCardModel) then) =
      _$ItemBalanceCardModelCopyWithImpl<$Res, ItemBalanceCardModel>;
  @useResult
  $Res call({String id, String name, double amount, int currencyId});
}

/// @nodoc
class _$ItemBalanceCardModelCopyWithImpl<$Res,
        $Val extends ItemBalanceCardModel>
    implements $ItemBalanceCardModelCopyWith<$Res> {
  _$ItemBalanceCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? currencyId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemBalanceCardCopyWith<$Res>
    implements $ItemBalanceCardModelCopyWith<$Res> {
  factory _$$_ItemBalanceCardCopyWith(
          _$_ItemBalanceCard value, $Res Function(_$_ItemBalanceCard) then) =
      __$$_ItemBalanceCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double amount, int currencyId});
}

/// @nodoc
class __$$_ItemBalanceCardCopyWithImpl<$Res>
    extends _$ItemBalanceCardModelCopyWithImpl<$Res, _$_ItemBalanceCard>
    implements _$$_ItemBalanceCardCopyWith<$Res> {
  __$$_ItemBalanceCardCopyWithImpl(
      _$_ItemBalanceCard _value, $Res Function(_$_ItemBalanceCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? currencyId = null,
  }) {
    return _then(_$_ItemBalanceCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemBalanceCard extends _ItemBalanceCard {
  _$_ItemBalanceCard(
      {required this.id,
      required this.name,
      required this.amount,
      required this.currencyId})
      : super._();

  factory _$_ItemBalanceCard.fromJson(Map<String, dynamic> json) =>
      _$$_ItemBalanceCardFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  final int currencyId;

  @override
  String toString() {
    return 'ItemBalanceCardModel(id: $id, name: $name, amount: $amount, currencyId: $currencyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemBalanceCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, amount, currencyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemBalanceCardCopyWith<_$_ItemBalanceCard> get copyWith =>
      __$$_ItemBalanceCardCopyWithImpl<_$_ItemBalanceCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemBalanceCardToJson(
      this,
    );
  }
}

abstract class _ItemBalanceCard extends ItemBalanceCardModel {
  factory _ItemBalanceCard(
      {required final String id,
      required final String name,
      required final double amount,
      required final int currencyId}) = _$_ItemBalanceCard;
  _ItemBalanceCard._() : super._();

  factory _ItemBalanceCard.fromJson(Map<String, dynamic> json) =
      _$_ItemBalanceCard.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  int get currencyId;
  @override
  @JsonKey(ignore: true)
  _$$_ItemBalanceCardCopyWith<_$_ItemBalanceCard> get copyWith =>
      throw _privateConstructorUsedError;
}
