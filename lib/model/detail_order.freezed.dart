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
  DetailOrder get data => throw _privateConstructorUsedError;

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
  $Res call({bool success, String message, DetailOrder data});

  $DetailOrderCopyWith<$Res> get data;
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
              as DetailOrder,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailOrderCopyWith<$Res> get data {
    return $DetailOrderCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
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
  $Res call({bool success, String message, DetailOrder data});

  @override
  $DetailOrderCopyWith<$Res> get data;
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
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailOrderResponseImpl implements _DetailOrderResponse {
  const _$DetailOrderResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$DetailOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailOrderResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final DetailOrder data;

  @override
  String toString() {
    return 'DetailOrderResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailOrderResponseImpl &&
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
      required final DetailOrder data}) = _$DetailOrderResponseImpl;

  factory _DetailOrderResponse.fromJson(Map<String, dynamic> json) =
      _$DetailOrderResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  DetailOrder get data;
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
  int get orderNumber => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isOnLocation => throw _privateConstructorUsedError;
  bool get isAccepted => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userAvatar => throw _privateConstructorUsedError;
  int get userPhone => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get storeLocation => throw _privateConstructorUsedError;
  String get serviceImage => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get servicePrice => throw _privateConstructorUsedError;
  String? get employeeAvatar => throw _privateConstructorUsedError;
  String? get employeeName => throw _privateConstructorUsedError;
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
      int orderNumber,
      DateTime endTime,
      String description,
      bool isOnLocation,
      bool isAccepted,
      String status,
      String userName,
      String userAvatar,
      int userPhone,
      String storeName,
      String storeLocation,
      String serviceImage,
      String serviceName,
      int servicePrice,
      String? employeeAvatar,
      String? employeeName,
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
    Object? orderNumber = null,
    Object? endTime = null,
    Object? description = null,
    Object? isOnLocation = null,
    Object? isAccepted = null,
    Object? status = null,
    Object? userName = null,
    Object? userAvatar = null,
    Object? userPhone = null,
    Object? storeName = null,
    Object? storeLocation = null,
    Object? serviceImage = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? employeeAvatar = freezed,
    Object? employeeName = freezed,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isOnLocation: null == isOnLocation
          ? _value.isOnLocation
          : isOnLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatar: null == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLocation: null == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String,
      serviceImage: null == serviceImage
          ? _value.serviceImage
          : serviceImage // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      employeeAvatar: freezed == employeeAvatar
          ? _value.employeeAvatar
          : employeeAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      int orderNumber,
      DateTime endTime,
      String description,
      bool isOnLocation,
      bool isAccepted,
      String status,
      String userName,
      String userAvatar,
      int userPhone,
      String storeName,
      String storeLocation,
      String serviceImage,
      String serviceName,
      int servicePrice,
      String? employeeAvatar,
      String? employeeName,
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
    Object? orderNumber = null,
    Object? endTime = null,
    Object? description = null,
    Object? isOnLocation = null,
    Object? isAccepted = null,
    Object? status = null,
    Object? userName = null,
    Object? userAvatar = null,
    Object? userPhone = null,
    Object? storeName = null,
    Object? storeLocation = null,
    Object? serviceImage = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? employeeAvatar = freezed,
    Object? employeeName = freezed,
    Object? reference = freezed,
  }) {
    return _then(_$DetailOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isOnLocation: null == isOnLocation
          ? _value.isOnLocation
          : isOnLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccepted: null == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatar: null == userAvatar
          ? _value.userAvatar
          : userAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      storeLocation: null == storeLocation
          ? _value.storeLocation
          : storeLocation // ignore: cast_nullable_to_non_nullable
              as String,
      serviceImage: null == serviceImage
          ? _value.serviceImage
          : serviceImage // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      employeeAvatar: freezed == employeeAvatar
          ? _value.employeeAvatar
          : employeeAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.orderNumber,
      required this.endTime,
      required this.description,
      required this.isOnLocation,
      required this.isAccepted,
      required this.status,
      required this.userName,
      required this.userAvatar,
      required this.userPhone,
      required this.storeName,
      required this.storeLocation,
      required this.serviceImage,
      required this.serviceName,
      required this.servicePrice,
      required this.employeeAvatar,
      required this.employeeName,
      required this.reference});

  factory _$DetailOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailOrderImplFromJson(json);

  @override
  final String id;
  @override
  final int orderNumber;
  @override
  final DateTime endTime;
  @override
  final String description;
  @override
  final bool isOnLocation;
  @override
  final bool isAccepted;
  @override
  final String status;
  @override
  final String userName;
  @override
  final String userAvatar;
  @override
  final int userPhone;
  @override
  final String storeName;
  @override
  final String storeLocation;
  @override
  final String serviceImage;
  @override
  final String serviceName;
  @override
  final int servicePrice;
  @override
  final String? employeeAvatar;
  @override
  final String? employeeName;
  @override
  final Reference? reference;

  @override
  String toString() {
    return 'DetailOrder(id: $id, orderNumber: $orderNumber, endTime: $endTime, description: $description, isOnLocation: $isOnLocation, isAccepted: $isAccepted, status: $status, userName: $userName, userAvatar: $userAvatar, userPhone: $userPhone, storeName: $storeName, storeLocation: $storeLocation, serviceImage: $serviceImage, serviceName: $serviceName, servicePrice: $servicePrice, employeeAvatar: $employeeAvatar, employeeName: $employeeName, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isOnLocation, isOnLocation) ||
                other.isOnLocation == isOnLocation) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeLocation, storeLocation) ||
                other.storeLocation == storeLocation) &&
            (identical(other.serviceImage, serviceImage) ||
                other.serviceImage == serviceImage) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.servicePrice, servicePrice) ||
                other.servicePrice == servicePrice) &&
            (identical(other.employeeAvatar, employeeAvatar) ||
                other.employeeAvatar == employeeAvatar) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      endTime,
      description,
      isOnLocation,
      isAccepted,
      status,
      userName,
      userAvatar,
      userPhone,
      storeName,
      storeLocation,
      serviceImage,
      serviceName,
      servicePrice,
      employeeAvatar,
      employeeName,
      reference);

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
      required final int orderNumber,
      required final DateTime endTime,
      required final String description,
      required final bool isOnLocation,
      required final bool isAccepted,
      required final String status,
      required final String userName,
      required final String userAvatar,
      required final int userPhone,
      required final String storeName,
      required final String storeLocation,
      required final String serviceImage,
      required final String serviceName,
      required final int servicePrice,
      required final String? employeeAvatar,
      required final String? employeeName,
      required final Reference? reference}) = _$DetailOrderImpl;

  factory _DetailOrder.fromJson(Map<String, dynamic> json) =
      _$DetailOrderImpl.fromJson;

  @override
  String get id;
  @override
  int get orderNumber;
  @override
  DateTime get endTime;
  @override
  String get description;
  @override
  bool get isOnLocation;
  @override
  bool get isAccepted;
  @override
  String get status;
  @override
  String get userName;
  @override
  String get userAvatar;
  @override
  int get userPhone;
  @override
  String get storeName;
  @override
  String get storeLocation;
  @override
  String get serviceImage;
  @override
  String get serviceName;
  @override
  int get servicePrice;
  @override
  String? get employeeAvatar;
  @override
  String? get employeeName;
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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

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
  $Res call({String id, String name, String description, String image});
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
abstract class _$$ReferenceImplCopyWith<$Res>
    implements $ReferenceCopyWith<$Res> {
  factory _$$ReferenceImplCopyWith(
          _$ReferenceImpl value, $Res Function(_$ReferenceImpl) then) =
      __$$ReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, String image});
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
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$ReferenceImpl(
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
class _$ReferenceImpl implements _Reference {
  const _$ReferenceImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  factory _$ReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferenceImplFromJson(json);

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
    return 'Reference(id: $id, name: $name, description: $description, image: $image)';
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
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image);

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
      {required final String id,
      required final String name,
      required final String description,
      required final String image}) = _$ReferenceImpl;

  factory _Reference.fromJson(Map<String, dynamic> json) =
      _$ReferenceImpl.fromJson;

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
  _$$ReferenceImplCopyWith<_$ReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
