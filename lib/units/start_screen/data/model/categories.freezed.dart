// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OperationCategories {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  OperationType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OperationCategoriesCopyWith<OperationCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCategoriesCopyWith<$Res> {
  factory $OperationCategoriesCopyWith(
          OperationCategories value, $Res Function(OperationCategories) then) =
      _$OperationCategoriesCopyWithImpl<$Res, OperationCategories>;
  @useResult
  $Res call({String id, String title, String code, OperationType type});
}

/// @nodoc
class _$OperationCategoriesCopyWithImpl<$Res, $Val extends OperationCategories>
    implements $OperationCategoriesCopyWith<$Res> {
  _$OperationCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? code = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OperationCategoriesCopyWith<$Res>
    implements $OperationCategoriesCopyWith<$Res> {
  factory _$$_OperationCategoriesCopyWith(_$_OperationCategories value,
          $Res Function(_$_OperationCategories) then) =
      __$$_OperationCategoriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String code, OperationType type});
}

/// @nodoc
class __$$_OperationCategoriesCopyWithImpl<$Res>
    extends _$OperationCategoriesCopyWithImpl<$Res, _$_OperationCategories>
    implements _$$_OperationCategoriesCopyWith<$Res> {
  __$$_OperationCategoriesCopyWithImpl(_$_OperationCategories _value,
      $Res Function(_$_OperationCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? code = null,
    Object? type = null,
  }) {
    return _then(_$_OperationCategories(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OperationType,
    ));
  }
}

/// @nodoc

class _$_OperationCategories extends _OperationCategories {
  _$_OperationCategories(
      {required this.id,
      required this.title,
      required this.code,
      required this.type})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String code;
  @override
  final OperationType type;

  @override
  String toString() {
    return 'OperationCategories(id: $id, title: $title, code: $code, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationCategories &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, code, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperationCategoriesCopyWith<_$_OperationCategories> get copyWith =>
      __$$_OperationCategoriesCopyWithImpl<_$_OperationCategories>(
          this, _$identity);
}

abstract class _OperationCategories extends OperationCategories {
  factory _OperationCategories(
      {required final String id,
      required final String title,
      required final String code,
      required final OperationType type}) = _$_OperationCategories;
  _OperationCategories._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get code;
  @override
  OperationType get type;
  @override
  @JsonKey(ignore: true)
  _$$_OperationCategoriesCopyWith<_$_OperationCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
