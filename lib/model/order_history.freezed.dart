// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryResponse _$OrderHistoryResponseFromJson(Map<String, dynamic> json) {
  return _OrderHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  OrderHistoryResult get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryResponseCopyWith<OrderHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryResponseCopyWith<$Res> {
  factory $OrderHistoryResponseCopyWith(OrderHistoryResponse value,
          $Res Function(OrderHistoryResponse) then) =
      _$OrderHistoryResponseCopyWithImpl<$Res, OrderHistoryResponse>;
  @useResult
  $Res call({bool success, String message, OrderHistoryResult result});

  $OrderHistoryResultCopyWith<$Res> get result;
}

/// @nodoc
class _$OrderHistoryResponseCopyWithImpl<$Res,
        $Val extends OrderHistoryResponse>
    implements $OrderHistoryResponseCopyWith<$Res> {
  _$OrderHistoryResponseCopyWithImpl(this._value, this._then);

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
              as OrderHistoryResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryResultCopyWith<$Res> get result {
    return $OrderHistoryResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryResponseImplCopyWith<$Res>
    implements $OrderHistoryResponseCopyWith<$Res> {
  factory _$$OrderHistoryResponseImplCopyWith(_$OrderHistoryResponseImpl value,
          $Res Function(_$OrderHistoryResponseImpl) then) =
      __$$OrderHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, OrderHistoryResult result});

  @override
  $OrderHistoryResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$OrderHistoryResponseImplCopyWithImpl<$Res>
    extends _$OrderHistoryResponseCopyWithImpl<$Res, _$OrderHistoryResponseImpl>
    implements _$$OrderHistoryResponseImplCopyWith<$Res> {
  __$$OrderHistoryResponseImplCopyWithImpl(_$OrderHistoryResponseImpl _value,
      $Res Function(_$OrderHistoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$OrderHistoryResponseImpl(
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
              as OrderHistoryResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryResponseImpl implements _OrderHistoryResponse {
  const _$OrderHistoryResponseImpl(
      {required this.success, required this.message, required this.result});

  factory _$OrderHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final OrderHistoryResult result;

  @override
  String toString() {
    return 'OrderHistoryResponse(success: $success, message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryResponseImpl &&
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
  _$$OrderHistoryResponseImplCopyWith<_$OrderHistoryResponseImpl>
      get copyWith =>
          __$$OrderHistoryResponseImplCopyWithImpl<_$OrderHistoryResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryResponse implements OrderHistoryResponse {
  const factory _OrderHistoryResponse(
      {required final bool success,
      required final String message,
      required final OrderHistoryResult result}) = _$OrderHistoryResponseImpl;

  factory _OrderHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  OrderHistoryResult get result;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryResponseImplCopyWith<_$OrderHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderHistoryResult _$OrderHistoryResultFromJson(Map<String, dynamic> json) {
  return _OrderHistoryResult.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryResult {
  int? get totalCount => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<Graph>? get graph => throw _privateConstructorUsedError;
  List<OrderHistory> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryResultCopyWith<OrderHistoryResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryResultCopyWith<$Res> {
  factory $OrderHistoryResultCopyWith(
          OrderHistoryResult value, $Res Function(OrderHistoryResult) then) =
      _$OrderHistoryResultCopyWithImpl<$Res, OrderHistoryResult>;
  @useResult
  $Res call(
      {int? totalCount,
      int? totalPages,
      List<Graph>? graph,
      List<OrderHistory> data});
}

/// @nodoc
class _$OrderHistoryResultCopyWithImpl<$Res, $Val extends OrderHistoryResult>
    implements $OrderHistoryResultCopyWith<$Res> {
  _$OrderHistoryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? graph = freezed,
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
      graph: freezed == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<Graph>?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OrderHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryResultImplCopyWith<$Res>
    implements $OrderHistoryResultCopyWith<$Res> {
  factory _$$OrderHistoryResultImplCopyWith(_$OrderHistoryResultImpl value,
          $Res Function(_$OrderHistoryResultImpl) then) =
      __$$OrderHistoryResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalCount,
      int? totalPages,
      List<Graph>? graph,
      List<OrderHistory> data});
}

/// @nodoc
class __$$OrderHistoryResultImplCopyWithImpl<$Res>
    extends _$OrderHistoryResultCopyWithImpl<$Res, _$OrderHistoryResultImpl>
    implements _$$OrderHistoryResultImplCopyWith<$Res> {
  __$$OrderHistoryResultImplCopyWithImpl(_$OrderHistoryResultImpl _value,
      $Res Function(_$OrderHistoryResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? totalPages = freezed,
    Object? graph = freezed,
    Object? data = null,
  }) {
    return _then(_$OrderHistoryResultImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      graph: freezed == graph
          ? _value._graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<Graph>?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OrderHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryResultImpl implements _OrderHistoryResult {
  const _$OrderHistoryResultImpl(
      {required this.totalCount,
      required this.totalPages,
      required final List<Graph>? graph,
      required final List<OrderHistory> data})
      : _graph = graph,
        _data = data;

  factory _$OrderHistoryResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryResultImplFromJson(json);

  @override
  final int? totalCount;
  @override
  final int? totalPages;
  final List<Graph>? _graph;
  @override
  List<Graph>? get graph {
    final value = _graph;
    if (value == null) return null;
    if (_graph is EqualUnmodifiableListView) return _graph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderHistory> _data;
  @override
  List<OrderHistory> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'OrderHistoryResult(totalCount: $totalCount, totalPages: $totalPages, graph: $graph, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryResultImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._graph, _graph) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCount,
      totalPages,
      const DeepCollectionEquality().hash(_graph),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryResultImplCopyWith<_$OrderHistoryResultImpl> get copyWith =>
      __$$OrderHistoryResultImplCopyWithImpl<_$OrderHistoryResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryResultImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryResult implements OrderHistoryResult {
  const factory _OrderHistoryResult(
      {required final int? totalCount,
      required final int? totalPages,
      required final List<Graph>? graph,
      required final List<OrderHistory> data}) = _$OrderHistoryResultImpl;

  factory _OrderHistoryResult.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryResultImpl.fromJson;

  @override
  int? get totalCount;
  @override
  int? get totalPages;
  @override
  List<Graph>? get graph;
  @override
  List<OrderHistory> get data;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryResultImplCopyWith<_$OrderHistoryResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return _OrderHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderHistory {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get servicePrice => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  String get orderDescription => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String storeId,
      String serviceName,
      int servicePrice,
      DateTime orderDate,
      String orderDescription,
      String status});
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? storeId = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? orderDate = null,
    Object? orderDescription = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderDescription: null == orderDescription
          ? _value.orderDescription
          : orderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryImplCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$OrderHistoryImplCopyWith(
          _$OrderHistoryImpl value, $Res Function(_$OrderHistoryImpl) then) =
      __$$OrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String storeId,
      String serviceName,
      int servicePrice,
      DateTime orderDate,
      String orderDescription,
      String status});
}

/// @nodoc
class __$$OrderHistoryImplCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$OrderHistoryImpl>
    implements _$$OrderHistoryImplCopyWith<$Res> {
  __$$OrderHistoryImplCopyWithImpl(
      _$OrderHistoryImpl _value, $Res Function(_$OrderHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? storeId = null,
    Object? serviceName = null,
    Object? servicePrice = null,
    Object? orderDate = null,
    Object? orderDescription = null,
    Object? status = null,
  }) {
    return _then(_$OrderHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      servicePrice: null == servicePrice
          ? _value.servicePrice
          : servicePrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderDescription: null == orderDescription
          ? _value.orderDescription
          : orderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryImpl implements _OrderHistory {
  const _$OrderHistoryImpl(
      {required this.id,
      required this.orderId,
      required this.storeId,
      required this.serviceName,
      required this.servicePrice,
      required this.orderDate,
      required this.orderDescription,
      required this.status});

  factory _$OrderHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String storeId;
  @override
  final String serviceName;
  @override
  final int servicePrice;
  @override
  final DateTime orderDate;
  @override
  final String orderDescription;
  @override
  final String status;

  @override
  String toString() {
    return 'OrderHistory(id: $id, orderId: $orderId, storeId: $storeId, serviceName: $serviceName, servicePrice: $servicePrice, orderDate: $orderDate, orderDescription: $orderDescription, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.servicePrice, servicePrice) ||
                other.servicePrice == servicePrice) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderDescription, orderDescription) ||
                other.orderDescription == orderDescription) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, storeId,
      serviceName, servicePrice, orderDate, orderDescription, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      __$$OrderHistoryImplCopyWithImpl<_$OrderHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryImplToJson(
      this,
    );
  }
}

abstract class _OrderHistory implements OrderHistory {
  const factory _OrderHistory(
      {required final String id,
      required final String orderId,
      required final String storeId,
      required final String serviceName,
      required final int servicePrice,
      required final DateTime orderDate,
      required final String orderDescription,
      required final String status}) = _$OrderHistoryImpl;

  factory _OrderHistory.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get storeId;
  @override
  String get serviceName;
  @override
  int get servicePrice;
  @override
  DateTime get orderDate;
  @override
  String get orderDescription;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return _Graph.fromJson(json);
}

/// @nodoc
mixin _$Graph {
  String get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphCopyWith<Graph> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCopyWith<$Res> {
  factory $GraphCopyWith(Graph value, $Res Function(Graph) then) =
      _$GraphCopyWithImpl<$Res, Graph>;
  @useResult
  $Res call({String date, int count});
}

/// @nodoc
class _$GraphCopyWithImpl<$Res, $Val extends Graph>
    implements $GraphCopyWith<$Res> {
  _$GraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphImplCopyWith<$Res> implements $GraphCopyWith<$Res> {
  factory _$$GraphImplCopyWith(
          _$GraphImpl value, $Res Function(_$GraphImpl) then) =
      __$$GraphImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int count});
}

/// @nodoc
class __$$GraphImplCopyWithImpl<$Res>
    extends _$GraphCopyWithImpl<$Res, _$GraphImpl>
    implements _$$GraphImplCopyWith<$Res> {
  __$$GraphImplCopyWithImpl(
      _$GraphImpl _value, $Res Function(_$GraphImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$GraphImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraphImpl implements _Graph {
  const _$GraphImpl({required this.date, required this.count});

  factory _$GraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphImplFromJson(json);

  @override
  final String date;
  @override
  final int count;

  @override
  String toString() {
    return 'Graph(date: $date, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphImplCopyWith<_$GraphImpl> get copyWith =>
      __$$GraphImplCopyWithImpl<_$GraphImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphImplToJson(
      this,
    );
  }
}

abstract class _Graph implements Graph {
  const factory _Graph({required final String date, required final int count}) =
      _$GraphImpl;

  factory _Graph.fromJson(Map<String, dynamic> json) = _$GraphImpl.fromJson;

  @override
  String get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$GraphImplCopyWith<_$GraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
