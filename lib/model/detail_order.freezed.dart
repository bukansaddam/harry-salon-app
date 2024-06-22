// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailOrderResponse _$DetailOrderResponseFromJson(Map<String, dynamic> json) {
  return _DetailOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailOrderResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DetailOrder? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailOrderResponseCopyWith<DetailOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailOrderResponseCopyWith<$Res> {
  factory $DetailOrderResponseCopyWith(
          DetailOrderResponse value, $Res Function(DetailOrderResponse) then) =
      _$DetailOrderResponseCopyWithImpl<$Res, DetailOrderResponse>;
  @useResult
  $Res call({bool success, String message, DetailOrder? result});

  $DetailOrderCopyWith<$Res>? get result;
}

/// @nodoc
class _$DetailOrderResponseCopyWithImpl<$Res, $Val extends DetailOrderResponse>
    implements $DetailOrderResponseCopyWith<$Res> {
  _$DetailOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = freezed,
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
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as DetailOrder?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailOrderCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $DetailOrderCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailOrderResponseImplCopyWith<$Res>
    implements $DetailOrderResponseCopyWith<$Res> {
  factory _$$DetailOrderResponseImplCopyWith(_$DetailOrderResponseImpl value,
          $Res Function(_$DetailOrderResponseImpl) then) =
      __$$DetailOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DetailOrder? result});

  @override
  $DetailOrderCopyWith<$Res>? get result;
}

/// @nodoc
class __$$DetailOrderResponseImplCopyWithImpl<$Res>
    extends _$DetailOrderResponseCopyWithImpl<$Res, _$DetailOrderResponseImpl>
    implements _$$DetailOrderResponseImplCopyWith<$Res> {
  __$$DetailOrderResponseImplCopyWithImpl(_$DetailOrderResponseImpl _value,
      $Res Function(_$DetailOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = freezed,
  }) {
    return _then(_$DetailOrderResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as DetailOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailOrderResponseImpl implements _DetailOrderResponse {
  const _$DetailOrderResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$DetailOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailOrder? result;

  @override
  String toString() {
    return 'DetailOrderResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailOrderResponseImpl &&
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
  _$$DetailOrderResponseImplCopyWith<_$DetailOrderResponseImpl> get copyWith =>
      __$$DetailOrderResponseImplCopyWithImpl<_$DetailOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailOrderResponse implements DetailOrderResponse {
  const factory _DetailOrderResponse(
      {required final bool success,
      required final String message,
      required final DetailOrder? result}) = _$DetailOrderResponseImpl;

  factory _DetailOrderResponse.fromJson(Map<String, dynamic> json) =
      _$DetailOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailOrder? get result;
  @override
  @JsonKey(ignore: true)
  _$$DetailOrderResponseImplCopyWith<_$DetailOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailOrder _$DetailOrderFromJson(Map<String, dynamic> json) {
  return _DetailOrder.fromJson(json);
}

/// @nodoc
mixin _$DetailOrder {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get storeLocation => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get servicePrice => throw _privateConstructorUsedError;
  Reference? get reference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailOrderCopyWith<DetailOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailOrderCopyWith<$Res> {
  factory $DetailOrderCopyWith(
          DetailOrder value, $Res Function(DetailOrder) then) =
      _$DetailOrderCopyWithImpl<$Res, DetailOrder>;
  @useResult
  $Res call(
      {String id,
      String description,
      String storeName,
      String storeLocation,
      String serviceName,
      int servicePrice,
      Reference? reference});

  $ReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class _$DetailOrderCopyWithImpl<$Res, $Val extends DetailOrder>
    implements $DetailOrderCopyWith<$Res> {
  _$DetailOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? storeName = null,
    Object? storeLocation = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLocation: null == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferenceCopyWith<$Res>? get reference {
    if (_value.reference == null) {
      return null;
    }

    return $ReferenceCopyWith<$Res>(_value.reference!, (value) {
      return _then(_value.copyWith(reference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailOrderImplCopyWith<$Res>
    implements $DetailOrderCopyWith<$Res> {
  factory _$$DetailOrderImplCopyWith(
          _$DetailOrderImpl value, $Res Function(_$DetailOrderImpl) then) =
      __$$DetailOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      String storeName,
      String storeLocation,
      String serviceName,
      int servicePrice,
      Reference? reference});

  @override
  $ReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class __$$DetailOrderImplCopyWithImpl<$Res>
    extends _$DetailOrderCopyWithImpl<$Res, _$DetailOrderImpl>
    implements _$$DetailOrderImplCopyWith<$Res> {
  __$$DetailOrderImplCopyWithImpl(
      _$DetailOrderImpl _value, $Res Function(_$DetailOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? storeName = null,
    Object? storeLocation = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? reference = freezed,
  }) {
    return _then(_$DetailOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLocation: null == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as Reference?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailOrderImpl implements _DetailOrder {
  const _$DetailOrderImpl(
      {required this.id,
      required this.description,
      required this.storeName,
      required this.storeLocation,
      required this.serviceName,
      required this.servicePrice,
      required this.reference});

  factory _$DetailOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailOrderImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String storeName;
  @override
  final String storeLocation;
  @override
  final String serviceName;
  @override
  final int servicePrice;
  @override
  final Reference? reference;

  @override
  String toString() {
    return 'DetailOrder(id: $id, description: $description, storeName: $storeName, storeLocation: $storeLocation, serviceName: $serviceName, servicePrice: $servicePrice, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeLocation, storeLocation) ||
                other.storeLocation == storeLocation) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.servicePrice, servicePrice) ||
                other.servicePrice == servicePrice) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, storeName,
      storeLocation, serviceName, servicePrice, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailOrderImplCopyWith<_$DetailOrderImpl> get copyWith =>
      __$$DetailOrderImplCopyWithImpl<_$DetailOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailOrderImplToJson(
      this,
    );
  }
}

abstract class _DetailOrder implements DetailOrder {
  const factory _DetailOrder(
      {required final String id,
      required final String description,
      required final String storeName,
      required final String storeLocation,
      required final String serviceName,
      required final int servicePrice,
      required final Reference? reference}) = _$DetailOrderImpl;

  factory _DetailOrder.fromJson(Map<String, dynamic> json) =
      _$DetailOrderImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  String get storeName;
  @override
  String get storeLocation;
  @override
  String get serviceName;
  @override
  int get servicePrice;
  @override
  Reference? get reference;
  @override
  @JsonKey(ignore: true)
  _$$DetailOrderImplCopyWith<_$DetailOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return _Reference.fromJson(json);
}

/// @nodoc
mixin _$Reference {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferenceCopyWith<Reference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferenceCopyWith<$Res> {
  factory $ReferenceCopyWith(Reference value, $Res Function(Reference) then) =
      _$ReferenceCopyWithImpl<$Res, Reference>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ReferenceCopyWithImpl<$Res, $Val extends Reference>
    implements $ReferenceCopyWith<$Res> {
  _$ReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferenceImplCopyWith<$Res>
    implements $ReferenceCopyWith<$Res> {
  factory _$$ReferenceImplCopyWith(
          _$ReferenceImpl value, $Res Function(_$ReferenceImpl) then) =
      __$$ReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ReferenceImplCopyWithImpl<$Res>
    extends _$ReferenceCopyWithImpl<$Res, _$ReferenceImpl>
    implements _$$ReferenceImplCopyWith<$Res> {
  __$$ReferenceImplCopyWithImpl(
      _$ReferenceImpl _value, $Res Function(_$ReferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReferenceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferenceImpl implements _Reference {
  const _$ReferenceImpl(
      {this.id, this.name, this.description, this.createdAt, this.updatedAt});

  factory _$ReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferenceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Reference(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferenceImplCopyWith<_$ReferenceImpl> get copyWith =>
      __$$ReferenceImplCopyWithImpl<_$ReferenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferenceImplToJson(
      this,
    );
  }
}

abstract class _Reference implements Reference {
  const factory _Reference(
      {final String? id,
      final String? name,
      final String? description,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ReferenceImpl;

  factory _Reference.fromJson(Map<String, dynamic> json) =
      _$ReferenceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReferenceImplCopyWith<_$ReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
