// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailStoreResponse _$DetailStoreResponseFromJson(Map<String, dynamic> json) {
  return _DetailStoreResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailStoreResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailStore get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStoreResponseCopyWith<DetailStoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoreResponseCopyWith<$Res> {
  factory $DetailStoreResponseCopyWith(
          DetailStoreResponse value, $Res Function(DetailStoreResponse) then) =
      _$DetailStoreResponseCopyWithImpl<$Res, DetailStoreResponse>;
  @useResult
  $Res call({bool success, String message, DetailStore data});

  $DetailStoreCopyWith<$Res> get data;
}

/// @nodoc
class _$DetailStoreResponseCopyWithImpl<$Res, $Val extends DetailStoreResponse>
    implements $DetailStoreResponseCopyWith<$Res> {
  _$DetailStoreResponseCopyWithImpl(this._value, this._then);

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
              as DetailStore,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailStoreCopyWith<$Res> get data {
    return $DetailStoreCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailStoreResponseImplCopyWith<$Res>
    implements $DetailStoreResponseCopyWith<$Res> {
  factory _$$DetailStoreResponseImplCopyWith(_$DetailStoreResponseImpl value,
          $Res Function(_$DetailStoreResponseImpl) then) =
      __$$DetailStoreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailStore data});

  @override
  $DetailStoreCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailStoreResponseImplCopyWithImpl<$Res>
    extends _$DetailStoreResponseCopyWithImpl<$Res, _$DetailStoreResponseImpl>
    implements _$$DetailStoreResponseImplCopyWith<$Res> {
  __$$DetailStoreResponseImplCopyWithImpl(_$DetailStoreResponseImpl _value,
      $Res Function(_$DetailStoreResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DetailStoreResponseImpl(
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
              as DetailStore,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStoreResponseImpl implements _DetailStoreResponse {
  const _$DetailStoreResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailStoreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStoreResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailStore data;

  @override
  String toString() {
    return 'DetailStoreResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoreResponseImpl &&
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
  _$$DetailStoreResponseImplCopyWith<_$DetailStoreResponseImpl> get copyWith =>
      __$$DetailStoreResponseImplCopyWithImpl<_$DetailStoreResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStoreResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailStoreResponse implements DetailStoreResponse {
  const factory _DetailStoreResponse(
      {required final bool success,
      required final String message,
      required final DetailStore data}) = _$DetailStoreResponseImpl;

  factory _DetailStoreResponse.fromJson(Map<String, dynamic> json) =
      _$DetailStoreResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailStore get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailStoreResponseImplCopyWith<_$DetailStoreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailStore _$DetailStoreFromJson(Map<String, dynamic> json) {
  return _DetailStore.fromJson(json);
}

/// @nodoc
mixin _$DetailStore {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get openAt => throw _privateConstructorUsedError;
  String get closeAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<StoreImage> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStoreCopyWith<DetailStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoreCopyWith<$Res> {
  factory $DetailStoreCopyWith(
          DetailStore value, $Res Function(DetailStore) then) =
      _$DetailStoreCopyWithImpl<$Res, DetailStore>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String location,
      double longitude,
      double latitude,
      String openAt,
      String closeAt,
      bool isActive,
      String ownerId,
      DateTime createdAt,
      DateTime updatedAt,
      List<StoreImage> images});
}

/// @nodoc
class _$DetailStoreCopyWithImpl<$Res, $Val extends DetailStore>
    implements $DetailStoreCopyWith<$Res> {
  _$DetailStoreCopyWithImpl(this._value, this._then);

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
    Object? location = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? openAt = null,
    Object? closeAt = null,
    Object? isActive = null,
    Object? ownerId = null,
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      openAt: null == openAt
          ? _value.openAt
          : openAt // ignore: cast_nullable_to_non_nullable
              as String,
      closeAt: null == closeAt
          ? _value.closeAt
          : closeAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
              as List<StoreImage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailStoreImplCopyWith<$Res>
    implements $DetailStoreCopyWith<$Res> {
  factory _$$DetailStoreImplCopyWith(
          _$DetailStoreImpl value, $Res Function(_$DetailStoreImpl) then) =
      __$$DetailStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String location,
      double longitude,
      double latitude,
      String openAt,
      String closeAt,
      bool isActive,
      String ownerId,
      DateTime createdAt,
      DateTime updatedAt,
      List<StoreImage> images});
}

/// @nodoc
class __$$DetailStoreImplCopyWithImpl<$Res>
    extends _$DetailStoreCopyWithImpl<$Res, _$DetailStoreImpl>
    implements _$$DetailStoreImplCopyWith<$Res> {
  __$$DetailStoreImplCopyWithImpl(
      _$DetailStoreImpl _value, $Res Function(_$DetailStoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? openAt = null,
    Object? closeAt = null,
    Object? isActive = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? images = null,
  }) {
    return _then(_$DetailStoreImpl(
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      openAt: null == openAt
          ? _value.openAt
          : openAt // ignore: cast_nullable_to_non_nullable
              as String,
      closeAt: null == closeAt
          ? _value.closeAt
          : closeAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
              as List<StoreImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStoreImpl implements _DetailStore {
  const _$DetailStoreImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.longitude,
      required this.latitude,
      required this.openAt,
      required this.closeAt,
      required this.isActive,
      required this.ownerId,
      required this.createdAt,
      required this.updatedAt,
      required final List<StoreImage> images})
      : _images = images;

  factory _$DetailStoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStoreImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String location;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String openAt;
  @override
  final String closeAt;
  @override
  final bool isActive;
  @override
  final String ownerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<StoreImage> _images;
  @override
  List<StoreImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'DetailStore(id: $id, name: $name, description: $description, location: $location, longitude: $longitude, latitude: $latitude, openAt: $openAt, closeAt: $closeAt, isActive: $isActive, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.openAt, openAt) || other.openAt == openAt) &&
            (identical(other.closeAt, closeAt) || other.closeAt == closeAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      location,
      longitude,
      latitude,
      openAt,
      closeAt,
      isActive,
      ownerId,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoreImplCopyWith<_$DetailStoreImpl> get copyWith =>
      __$$DetailStoreImplCopyWithImpl<_$DetailStoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStoreImplToJson(
      this,
    );
  }
}

abstract class _DetailStore implements DetailStore {
  const factory _DetailStore(
      {required final String id,
      required final String name,
      required final String description,
      required final String location,
      required final double longitude,
      required final double latitude,
      required final String openAt,
      required final String closeAt,
      required final bool isActive,
      required final String ownerId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<StoreImage> images}) = _$DetailStoreImpl;

  factory _DetailStore.fromJson(Map<String, dynamic> json) =
      _$DetailStoreImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get location;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get openAt;
  @override
  String get closeAt;
  @override
  bool get isActive;
  @override
  String get ownerId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<StoreImage> get images;
  @override
  @JsonKey(ignore: true)
  _$$DetailStoreImplCopyWith<_$DetailStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreImage _$StoreImageFromJson(Map<String, dynamic> json) {
  return _StoreImage.fromJson(json);
}

/// @nodoc
mixin _$StoreImage {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreImageCopyWith<StoreImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreImageCopyWith<$Res> {
  factory $StoreImageCopyWith(
          StoreImage value, $Res Function(StoreImage) then) =
      _$StoreImageCopyWithImpl<$Res, StoreImage>;
  @useResult
  $Res call({String id, String image});
}

/// @nodoc
class _$StoreImageCopyWithImpl<$Res, $Val extends StoreImage>
    implements $StoreImageCopyWith<$Res> {
  _$StoreImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImageImplCopyWith<$Res>
    implements $StoreImageCopyWith<$Res> {
  factory _$$StoreImageImplCopyWith(
          _$StoreImageImpl value, $Res Function(_$StoreImageImpl) then) =
      __$$StoreImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String image});
}

/// @nodoc
class __$$StoreImageImplCopyWithImpl<$Res>
    extends _$StoreImageCopyWithImpl<$Res, _$StoreImageImpl>
    implements _$$StoreImageImplCopyWith<$Res> {
  __$$StoreImageImplCopyWithImpl(
      _$StoreImageImpl _value, $Res Function(_$StoreImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_$StoreImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$StoreImageImpl implements _StoreImage {
  const _$StoreImageImpl({required this.id, required this.image});

  factory _$StoreImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImageImplFromJson(json);

  @override
  final String id;
  @override
  final String image;

  @override
  String toString() {
    return 'StoreImage(id: $id, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImageImplCopyWith<_$StoreImageImpl> get copyWith =>
      __$$StoreImageImplCopyWithImpl<_$StoreImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImageImplToJson(
      this,
    );
  }
}

abstract class _StoreImage implements StoreImage {
  const factory _StoreImage(
      {required final String id,
      required final String image}) = _$StoreImageImpl;

  factory _StoreImage.fromJson(Map<String, dynamic> json) =
      _$StoreImageImpl.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$StoreImageImplCopyWith<_$StoreImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
