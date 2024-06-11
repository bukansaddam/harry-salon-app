// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hairstyle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HairstyleResponse _$HairstyleResponseFromJson(Map<String, dynamic> json) {
  return _HairstyleResponse.fromJson(json);
}

/// @nodoc
mixin _$HairstyleResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  HairstyleResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HairstyleResponseCopyWith<HairstyleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HairstyleResponseCopyWith<$Res> {
  factory $HairstyleResponseCopyWith(
          HairstyleResponse value, $Res Function(HairstyleResponse) then) =
      _$HairstyleResponseCopyWithImpl<$Res, HairstyleResponse>;
  @useResult
  $Res call({bool success, String message, HairstyleResult result});

  $HairstyleResultCopyWith<$Res> get result;
}

/// @nodoc
class _$HairstyleResponseCopyWithImpl<$Res, $Val extends HairstyleResponse>
    implements $HairstyleResponseCopyWith<$Res> {
  _$HairstyleResponseCopyWithImpl(this._value, this._then);

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
              as HairstyleResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HairstyleResultCopyWith<$Res> get result {
    return $HairstyleResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HairstyleResponseImplCopyWith<$Res>
    implements $HairstyleResponseCopyWith<$Res> {
  factory _$$HairstyleResponseImplCopyWith(_$HairstyleResponseImpl value,
          $Res Function(_$HairstyleResponseImpl) then) =
      __$$HairstyleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, HairstyleResult result});

  @override
  $HairstyleResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$HairstyleResponseImplCopyWithImpl<$Res>
    extends _$HairstyleResponseCopyWithImpl<$Res, _$HairstyleResponseImpl>
    implements _$$HairstyleResponseImplCopyWith<$Res> {
  __$$HairstyleResponseImplCopyWithImpl(_$HairstyleResponseImpl _value,
      $Res Function(_$HairstyleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$HairstyleResponseImpl(
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
              as HairstyleResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HairstyleResponseImpl implements _HairstyleResponse {
  const _$HairstyleResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$HairstyleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HairstyleResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final HairstyleResult result;

  @override
  String toString() {
    return 'HairstyleResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HairstyleResponseImpl &&
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
  _$$HairstyleResponseImplCopyWith<_$HairstyleResponseImpl> get copyWith =>
      __$$HairstyleResponseImplCopyWithImpl<_$HairstyleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HairstyleResponseImplToJson(
      this,
    );
  }
}

abstract class _HairstyleResponse implements HairstyleResponse {
  const factory _HairstyleResponse(
      {required final bool success,
      required final String message,
      required final HairstyleResult result}) = _$HairstyleResponseImpl;

  factory _HairstyleResponse.fromJson(Map<String, dynamic> json) =
      _$HairstyleResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  HairstyleResult get result;
  @override
  @JsonKey(ignore: true)
  _$$HairstyleResponseImplCopyWith<_$HairstyleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HairstyleResult _$HairstyleResultFromJson(Map<String, dynamic> json) {
  return _HairstyleResult.fromJson(json);
}

/// @nodoc
mixin _$HairstyleResult {
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  List<Hairstyle> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HairstyleResultCopyWith<HairstyleResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HairstyleResultCopyWith<$Res> {
  factory $HairstyleResultCopyWith(
          HairstyleResult value, $Res Function(HairstyleResult) then) =
      _$HairstyleResultCopyWithImpl<$Res, HairstyleResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<Hairstyle> data});
}

/// @nodoc
class _$HairstyleResultCopyWithImpl<$Res, $Val extends HairstyleResult>
    implements $HairstyleResultCopyWith<$Res> {
  _$HairstyleResultCopyWithImpl(this._value, this._then);

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
              as List<Hairstyle>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HairstyleResultImplCopyWith<$Res>
    implements $HairstyleResultCopyWith<$Res> {
  factory _$$HairstyleResultImplCopyWith(_$HairstyleResultImpl value,
          $Res Function(_$HairstyleResultImpl) then) =
      __$$HairstyleResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int? totalCount,
      @JsonKey(name: 'total_pages') int? totalPages,
      List<Hairstyle> data});
}

/// @nodoc
class __$$HairstyleResultImplCopyWithImpl<$Res>
    extends _$HairstyleResultCopyWithImpl<$Res, _$HairstyleResultImpl>
    implements _$$HairstyleResultImplCopyWith<$Res> {
  __$$HairstyleResultImplCopyWithImpl(
      _$HairstyleResultImpl _value, $Res Function(_$HairstyleResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? data = null,
  }) {
    return _then(_$HairstyleResultImpl(
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
              as List<Hairstyle>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HairstyleResultImpl implements _HairstyleResult {
  const _$HairstyleResultImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'total_pages') required this.totalPages,
      required final List<Hairstyle> data})
      : _data = data;

  factory _$HairstyleResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$HairstyleResultImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<Hairstyle> _data;
  @override
  List<Hairstyle> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HairstyleResult(totalCount: $totalCount, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HairstyleResultImpl &&
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
  _$$HairstyleResultImplCopyWith<_$HairstyleResultImpl> get copyWith =>
      __$$HairstyleResultImplCopyWithImpl<_$HairstyleResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HairstyleResultImplToJson(
      this,
    );
  }
}

abstract class _HairstyleResult implements HairstyleResult {
  const factory _HairstyleResult(
      {@JsonKey(name: 'total_count') required final int? totalCount,
      @JsonKey(name: 'total_pages') required final int? totalPages,
      required final List<Hairstyle> data}) = _$HairstyleResultImpl;

  factory _HairstyleResult.fromJson(Map<String, dynamic> json) =
      _$HairstyleResultImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  List<Hairstyle> get data;
  @override
  @JsonKey(ignore: true)
  _$$HairstyleResultImplCopyWith<_$HairstyleResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hairstyle _$HairstyleFromJson(Map<String, dynamic> json) {
  return _Hairstyle.fromJson(json);
}

/// @nodoc
mixin _$Hairstyle {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HairstyleCopyWith<Hairstyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HairstyleCopyWith<$Res> {
  factory $HairstyleCopyWith(Hairstyle value, $Res Function(Hairstyle) then) =
      _$HairstyleCopyWithImpl<$Res, Hairstyle>;
  @useResult
  $Res call({String id, String name, String description, String image});
}

/// @nodoc
class _$HairstyleCopyWithImpl<$Res, $Val extends Hairstyle>
    implements $HairstyleCopyWith<$Res> {
  _$HairstyleCopyWithImpl(this._value, this._then);

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
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HairstyleImplCopyWith<$Res>
    implements $HairstyleCopyWith<$Res> {
  factory _$$HairstyleImplCopyWith(
          _$HairstyleImpl value, $Res Function(_$HairstyleImpl) then) =
      __$$HairstyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, String image});
}

/// @nodoc
class __$$HairstyleImplCopyWithImpl<$Res>
    extends _$HairstyleCopyWithImpl<$Res, _$HairstyleImpl>
    implements _$$HairstyleImplCopyWith<$Res> {
  __$$HairstyleImplCopyWithImpl(
      _$HairstyleImpl _value, $Res Function(_$HairstyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$HairstyleImpl(
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HairstyleImpl implements _Hairstyle {
  const _$HairstyleImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  factory _$HairstyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HairstyleImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'Hairstyle(id: $id, name: $name, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HairstyleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HairstyleImplCopyWith<_$HairstyleImpl> get copyWith =>
      __$$HairstyleImplCopyWithImpl<_$HairstyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HairstyleImplToJson(
      this,
    );
  }
}

abstract class _Hairstyle implements Hairstyle {
  const factory _Hairstyle(
      {required final String id,
      required final String name,
      required final String description,
      required final String image}) = _$HairstyleImpl;

  factory _Hairstyle.fromJson(Map<String, dynamic> json) =
      _$HairstyleImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$HairstyleImplCopyWith<_$HairstyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
