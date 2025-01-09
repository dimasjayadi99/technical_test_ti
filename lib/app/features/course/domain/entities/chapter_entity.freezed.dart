// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChapterEntity {
  String get title => throw _privateConstructorUsedError;
  String get lessonId => throw _privateConstructorUsedError;
  String get lessonTitle => throw _privateConstructorUsedError;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterEntityCopyWith<ChapterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterEntityCopyWith<$Res> {
  factory $ChapterEntityCopyWith(
          ChapterEntity value, $Res Function(ChapterEntity) then) =
      _$ChapterEntityCopyWithImpl<$Res, ChapterEntity>;
  @useResult
  $Res call({String title, String lessonId, String lessonTitle});
}

/// @nodoc
class _$ChapterEntityCopyWithImpl<$Res, $Val extends ChapterEntity>
    implements $ChapterEntityCopyWith<$Res> {
  _$ChapterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lessonId = null,
    Object? lessonTitle = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonTitle: null == lessonTitle
          ? _value.lessonTitle
          : lessonTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterEntityImplCopyWith<$Res>
    implements $ChapterEntityCopyWith<$Res> {
  factory _$$ChapterEntityImplCopyWith(
          _$ChapterEntityImpl value, $Res Function(_$ChapterEntityImpl) then) =
      __$$ChapterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String lessonId, String lessonTitle});
}

/// @nodoc
class __$$ChapterEntityImplCopyWithImpl<$Res>
    extends _$ChapterEntityCopyWithImpl<$Res, _$ChapterEntityImpl>
    implements _$$ChapterEntityImplCopyWith<$Res> {
  __$$ChapterEntityImplCopyWithImpl(
      _$ChapterEntityImpl _value, $Res Function(_$ChapterEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lessonId = null,
    Object? lessonTitle = null,
  }) {
    return _then(_$ChapterEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonTitle: null == lessonTitle
          ? _value.lessonTitle
          : lessonTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChapterEntityImpl implements _ChapterEntity {
  _$ChapterEntityImpl(
      {required this.title, required this.lessonId, required this.lessonTitle});

  @override
  final String title;
  @override
  final String lessonId;
  @override
  final String lessonTitle;

  @override
  String toString() {
    return 'ChapterEntity(title: $title, lessonId: $lessonId, lessonTitle: $lessonTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.lessonTitle, lessonTitle) ||
                other.lessonTitle == lessonTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, lessonId, lessonTitle);

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterEntityImplCopyWith<_$ChapterEntityImpl> get copyWith =>
      __$$ChapterEntityImplCopyWithImpl<_$ChapterEntityImpl>(this, _$identity);
}

abstract class _ChapterEntity implements ChapterEntity {
  factory _ChapterEntity(
      {required final String title,
      required final String lessonId,
      required final String lessonTitle}) = _$ChapterEntityImpl;

  @override
  String get title;
  @override
  String get lessonId;
  @override
  String get lessonTitle;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterEntityImplCopyWith<_$ChapterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
