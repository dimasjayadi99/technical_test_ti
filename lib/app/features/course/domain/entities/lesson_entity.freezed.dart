// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonEntity {
  String get fileName => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonEntityCopyWith<LessonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonEntityCopyWith<$Res> {
  factory $LessonEntityCopyWith(
          LessonEntity value, $Res Function(LessonEntity) then) =
      _$LessonEntityCopyWithImpl<$Res, LessonEntity>;
  @useResult
  $Res call({String fileName, String filePath});
}

/// @nodoc
class _$LessonEntityCopyWithImpl<$Res, $Val extends LessonEntity>
    implements $LessonEntityCopyWith<$Res> {
  _$LessonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonEntityImplCopyWith<$Res>
    implements $LessonEntityCopyWith<$Res> {
  factory _$$LessonEntityImplCopyWith(
          _$LessonEntityImpl value, $Res Function(_$LessonEntityImpl) then) =
      __$$LessonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, String filePath});
}

/// @nodoc
class __$$LessonEntityImplCopyWithImpl<$Res>
    extends _$LessonEntityCopyWithImpl<$Res, _$LessonEntityImpl>
    implements _$$LessonEntityImplCopyWith<$Res> {
  __$$LessonEntityImplCopyWithImpl(
      _$LessonEntityImpl _value, $Res Function(_$LessonEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_$LessonEntityImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LessonEntityImpl implements _LessonEntity {
  _$LessonEntityImpl({required this.fileName, required this.filePath});

  @override
  final String fileName;
  @override
  final String filePath;

  @override
  String toString() {
    return 'LessonEntity(fileName: $fileName, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonEntityImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, filePath);

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonEntityImplCopyWith<_$LessonEntityImpl> get copyWith =>
      __$$LessonEntityImplCopyWithImpl<_$LessonEntityImpl>(this, _$identity);
}

abstract class _LessonEntity implements LessonEntity {
  factory _LessonEntity(
      {required final String fileName,
      required final String filePath}) = _$LessonEntityImpl;

  @override
  String get fileName;
  @override
  String get filePath;

  /// Create a copy of LessonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonEntityImplCopyWith<_$LessonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
