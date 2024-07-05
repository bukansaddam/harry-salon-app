// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) {
  return _FavoriteResponse.fromJson(json);
}

/// @nodoc
mixin _$FavoriteResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FavoriteResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) then) =
      _$FavoriteResponseCopyWithImpl<$Res, FavoriteResponse>;
  @useResult
  $Res call({bool success, String message, FavoriteResult result});

  $FavoriteResultCopyWith<$Res> get result;
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res, $Val extends FavoriteResponse>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
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
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as FavoriteResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FavoriteResultCopyWith<$Res> get result {
    return $FavoriteResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteResponseImplCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$$FavoriteResponseImplCopyWith(_$FavoriteResponseImpl value,
          $Res Function(_$FavoriteResponseImpl) then) =
      __$$FavoriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, FavoriteResult result});

  @override
  $FavoriteResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$FavoriteResponseImplCopyWithImpl<$Res>
    extends _$FavoriteResponseCopyWithImpl<$Res, _$FavoriteResponseImpl>
    implements _$$FavoriteResponseImplCopyWith<$Res> {
  __$$FavoriteResponseImplCopyWithImpl(_$FavoriteResponseImpl _value,
      $Res Function(_$FavoriteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$FavoriteResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as FavoriteResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteResponseImpl implements _FavoriteResponse {
  const _$FavoriteResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$FavoriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final FavoriteResult result;

  @override
  String toString() {
    return 'FavoriteResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      __$$FavoriteResponseImplCopyWithImpl<_$FavoriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteResponseImplToJson(
      this,
    );
  }
}

abstract class _FavoriteResponse implements FavoriteResponse {
  const factory _FavoriteResponse(
      {required final bool success,
      required final String message,
      required final FavoriteResult result}) = _$FavoriteResponseImpl;

  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) =
      _$FavoriteResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  FavoriteResult get result;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteResult _$FavoriteResultFromJson(Map<String, dynamic> json) {
  return _FavoriteResult.fromJson(json);
}

/// @nodoc
mixin _$FavoriteResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Favorite> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteResultCopyWith<FavoriteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResultCopyWith<$Res> {
  factory $FavoriteResultCopyWith(
          FavoriteResult value, $Res Function(FavoriteResult) then) =
      _$FavoriteResultCopyWithImpl<$Res, FavoriteResult>;
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Favorite> data});
}

/// @nodoc
class _$FavoriteResultCopyWithImpl<$Res, $Val extends FavoriteResult>
    implements $FavoriteResultCopyWith<$Res> {
  _$FavoriteResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Favorite>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteResultImplCopyWith<$Res>
    implements $FavoriteResultCopyWith<$Res> {
  factory _$$FavoriteResultImplCopyWith(_$FavoriteResultImpl value,
          $Res Function(_$FavoriteResultImpl) then) =
      __$$FavoriteResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, int? totalPages, List<Favorite> data});
}

/// @nodoc
class __$$FavoriteResultImplCopyWithImpl<$Res>
    extends _$FavoriteResultCopyWithImpl<$Res, _$FavoriteResultImpl>
    implements _$$FavoriteResultImplCopyWith<$Res> {
  __$$FavoriteResultImplCopyWithImpl(
      _$FavoriteResultImpl _value, $Res Function(_$FavoriteResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$FavoriteResultImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Favorite>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteResultImpl implements _FavoriteResult {
  const _$FavoriteResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Favorite> data})
      : _data = data;

  factory _$FavoriteResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Favorite> _data;
  @override
  List<Favorite> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavoriteResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteResultImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteResultImplCopyWith<_$FavoriteResultImpl> get copyWith =>
      __$$FavoriteResultImplCopyWithImpl<_$FavoriteResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteResultImplToJson(
      this,
    );
  }
}

abstract class _FavoriteResult implements FavoriteResult {
  const factory _FavoriteResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Favorite> data}) = _$FavoriteResultImpl;

  factory _FavoriteResult.fromJson(Map<String, dynamic> json) =
      _$FavoriteResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Favorite> get data;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteResultImplCopyWith<_$FavoriteResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  String get id => throw _privateConstructorUsedError;
  String get hairstyleId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {String id,
      String hairstyleId,
      String name,
      String description,
      String images});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hairstyleId = null,
    Object? name = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hairstyleId: null == hairstyleId
          ? _value.hairstyleId
          : hairstyleId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteImplCopyWith<$Res>
    implements $FavoriteCopyWith<$Res> {
  factory _$$FavoriteImplCopyWith(
          _$FavoriteImpl value, $Res Function(_$FavoriteImpl) then) =
      __$$FavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String hairstyleId,
      String name,
      String description,
      String images});
}

/// @nodoc
class __$$FavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$FavoriteImpl>
    implements _$$FavoriteImplCopyWith<$Res> {
  __$$FavoriteImplCopyWithImpl(
      _$FavoriteImpl _value, $Res Function(_$FavoriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hairstyleId = null,
    Object? name = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_$FavoriteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hairstyleId: null == hairstyleId
          ? _value.hairstyleId
          : hairstyleId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteImpl implements _Favorite {
  const _$FavoriteImpl(
      {required this.id,
      required this.hairstyleId,
      required this.name,
      required this.description,
      required this.images});

  factory _$FavoriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteImplFromJson(json);

  @override
  final String id;
  @override
  final String hairstyleId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String images;

  @override
  String toString() {
    return 'Favorite(id: $id, hairstyleId: $hairstyleId, name: $name, description: $description, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hairstyleId, hairstyleId) ||
                other.hairstyleId == hairstyleId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.images, images) || other.images == images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, hairstyleId, name, description, images);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      __$$FavoriteImplCopyWithImpl<_$FavoriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteImplToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {required final String id,
      required final String hairstyleId,
      required final String name,
      required final String description,
      required final String images}) = _$FavoriteImpl;

  factory _Favorite.fromJson(Map<String, dynamic> json) =
      _$FavoriteImpl.fromJson;

  @override
  String get id;
  @override
  String get hairstyleId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get images;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
