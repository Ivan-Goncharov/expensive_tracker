// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemOperationModel {
  String get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  OperationType get type => throw _privateConstructorUsedError;
  DateTime get dateOperation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemOperationModelCopyWith<ItemOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemOperationModelCopyWith<$Res> {
  factory $ItemOperationModelCopyWith(
          ItemOperationModel value, $Res Function(ItemOperationModel) then) =
      _$ItemOperationModelCopyWithImpl<$Res, ItemOperationModel>;
  @useResult
  $Res call(
      {String id,
      String category,
      double amount,
      OperationType type,
      DateTime dateOperation});
}

/// @nodoc
class _$ItemOperationModelCopyWithImpl<$Res, $Val extends ItemOperationModel>
    implements $ItemOperationModelCopyWith<$Res> {
  _$ItemOperationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? type = null,
    Object? dateOperation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OperationType,
      dateOperation: null == dateOperation
          ? _value.dateOperation
          : dateOperation // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemOperationModelCopyWith<$Res>
    implements $ItemOperationModelCopyWith<$Res> {
  factory _$$_ItemOperationModelCopyWith(_$_ItemOperationModel value,
          $Res Function(_$_ItemOperationModel) then) =
      __$$_ItemOperationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      double amount,
      OperationType type,
      DateTime dateOperation});
}

/// @nodoc
class __$$_ItemOperationModelCopyWithImpl<$Res>
    extends _$ItemOperationModelCopyWithImpl<$Res, _$_ItemOperationModel>
    implements _$$_ItemOperationModelCopyWith<$Res> {
  __$$_ItemOperationModelCopyWithImpl(
      _$_ItemOperationModel _value, $Res Function(_$_ItemOperationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? amount = null,
    Object? type = null,
    Object? dateOperation = null,
  }) {
    return _then(_$_ItemOperationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OperationType,
      dateOperation: null == dateOperation
          ? _value.dateOperation
          : dateOperation // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ItemOperationModel extends _ItemOperationModel {
  _$_ItemOperationModel(
      {required this.id,
      required this.category,
      required this.amount,
      required this.type,
      required this.dateOperation})
      : super._();

  @override
  final String id;
  @override
  final String category;
  @override
  final double amount;
  @override
  final OperationType type;
  @override
  final DateTime dateOperation;

  @override
  String toString() {
    return 'ItemOperationModel(id: $id, category: $category, amount: $amount, type: $type, dateOperation: $dateOperation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemOperationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dateOperation, dateOperation) ||
                other.dateOperation == dateOperation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, amount, type, dateOperation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemOperationModelCopyWith<_$_ItemOperationModel> get copyWith =>
      __$$_ItemOperationModelCopyWithImpl<_$_ItemOperationModel>(
          this, _$identity);
}

abstract class _ItemOperationModel extends ItemOperationModel {
  factory _ItemOperationModel(
      {required final String id,
      required final String category,
      required final double amount,
      required final OperationType type,
      required final DateTime dateOperation}) = _$_ItemOperationModel;
  _ItemOperationModel._() : super._();

  @override
  String get id;
  @override
  String get category;
  @override
  double get amount;
  @override
  OperationType get type;
  @override
  DateTime get dateOperation;
  @override
  @JsonKey(ignore: true)
  _$$_ItemOperationModelCopyWith<_$_ItemOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
