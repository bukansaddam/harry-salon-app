// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_hairstyle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailHairstyleResponse _$DetailHairstyleResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailHairstyleResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailHairstyleResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailHairstyle get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailHairstyleResponseCopyWith<DetailHairstyleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailHairstyleResponseCopyWith<$Res> {
  factory $DetailHairstyleResponseCopyWith(DetailHairstyleResponse value,
          $Res Function(DetailHairstyleResponse) then) =
      _$DetailHairstyleResponseCopyWithImpl<$Res, DetailHairstyleResponse>;
  @useResult
  $Res call({bool success, String message, DetailHairstyle data});

  $DetailHairstyleCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailHairstyleResponseCopyWithImpl<$Res,
        $Val extends DetailHairstyleResponse>
    implements $DetailHairstyleResponseCopyWith<$Res> {
  _$DetailHairstyleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailHairstyle,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailHairstyleCopyWith<$Res> get data {
    return $DetailHairstyleCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailHairstyleResponseImplCopyWith<$Res>
    implements $DetailHairstyleResponseCopyWith<$Res> {
  factory _$$DetailHairstyleResponseImplCopyWith(
          _$DetailHairstyleResponseImpl value,
          $Res Function(_$DetailHairstyleResponseImpl) then) =
      __$$DetailHairstyleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailHairstyle data});

  @override
  $DetailHairstyleCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailHairstyleResponseImplCopyWithImpl<$Res>
    extends _$DetailHairstyleResponseCopyWithImpl<$Res,
        _$DetailHairstyleResponseImpl>
    implements _$$DetailHairstyleResponseImplCopyWith<$Res> {
  __$$DetailHairstyleResponseImplCopyWithImpl(
      _$DetailHairstyleResponseImpl _value,
      $Res Function(_$DetailHairstyleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailHairstyleResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailHairstyle,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailHairstyleResponseImpl implements _DetailHairstyleResponse {
  const _$DetailHairstyleResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailHairstyleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailHairstyleResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailHairstyle data;

  @override
  String toString() {
    return 'DetailHairstyleResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailHairstyleResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailHairstyleResponseImplCopyWith<_$DetailHairstyleResponseImpl>
      get copyWith => __$$DetailHairstyleResponseImplCopyWithImpl<
          _$DetailHairstyleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailHairstyleResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailHairstyleResponse implements DetailHairstyleResponse {
  const factory _DetailHairstyleResponse(
      {required final bool success,
      required final String message,
      required final DetailHairstyle data}) = _$DetailHairstyleResponseImpl;

  factory _DetailHairstyleResponse.fromJson(Map<String, dynamic> json) =
      _$DetailHairstyleResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailHairstyle get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailHairstyleResponseImplCopyWith<_$DetailHairstyleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailHairstyle _$DetailHairstyleFromJson(Map<String, dynamic> json) {
  return _DetailHairstyle.fromJson(json);
}

/// @nodoc
mixin _$DetailHairstyle {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailHairstyleCopyWith<DetailHairstyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailHairstyleCopyWith<$Res> {
  factory $DetailHairstyleCopyWith(
          DetailHairstyle value, $Res Function(DetailHairstyle) then) =
      _$DetailHairstyleCopyWithImpl<$Res, DetailHairstyle>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> images});
}

/// @nodoc
class _$DetailHairstyleCopyWithImpl<$Res, $Val extends DetailHairstyle>
    implements $DetailHairstyleCopyWith<$Res> {
  _$DetailHairstyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? images = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailHairstyleImplCopyWith<$Res>
    implements $DetailHairstyleCopyWith<$Res> {
  factory _$$DetailHairstyleImplCopyWith(_$DetailHairstyleImpl value,
          $Res Function(_$DetailHairstyleImpl) then) =
      __$$DetailHairstyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      List<String> images});
}

/// @nodoc
class __$$DetailHairstyleImplCopyWithImpl<$Res>
    extends _$DetailHairstyleCopyWithImpl<$Res, _$DetailHairstyleImpl>
    implements _$$DetailHairstyleImplCopyWith<$Res> {
  __$$DetailHairstyleImplCopyWithImpl(
      _$DetailHairstyleImpl _value, $Res Function(_$DetailHairstyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? images = null,
  }) {
    return _then(_$DetailHairstyleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailHairstyleImpl implements _DetailHairstyle {
  const _$DetailHairstyleImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required final List<String> images})
      : _images = images;

  factory _$DetailHairstyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailHairstyleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'DetailHairstyle(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailHairstyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, createdAt,
      updatedAt, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailHairstyleImplCopyWith<_$DetailHairstyleImpl> get copyWith =>
      __$$DetailHairstyleImplCopyWithImpl<_$DetailHairstyleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailHairstyleImplToJson(
      this,
    );
  }
}

abstract class _DetailHairstyle implements DetailHairstyle {
  const factory _DetailHairstyle(
      {required final String id,
      required final String name,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<String> images}) = _$DetailHairstyleImpl;

  factory _DetailHairstyle.fromJson(Map<String, dynamic> json) =
      _$DetailHairstyleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$DetailHairstyleImplCopyWith<_$DetailHairstyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
