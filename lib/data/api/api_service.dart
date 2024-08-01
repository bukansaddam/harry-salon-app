import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir_app/model/commodity.dart';
import 'package:tugas_akhir_app/model/detail_commodity.dart';
import 'package:tugas_akhir_app/model/detail_employee.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';
import 'package:tugas_akhir_app/model/detail_order.dart';
import 'package:tugas_akhir_app/model/detail_payslip.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';
import 'package:tugas_akhir_app/model/employee.dart';
import 'package:tugas_akhir_app/model/favorite.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:tugas_akhir_app/model/login.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/model/order_history.dart';
import 'package:tugas_akhir_app/model/payslip.dart';
import 'package:tugas_akhir_app/model/presence.dart';
import 'package:tugas_akhir_app/model/qr_code.dart';
import 'package:tugas_akhir_app/model/queue.dart';
import 'package:tugas_akhir_app/model/register.dart';
import 'package:tugas_akhir_app/model/review.dart';
import 'package:tugas_akhir_app/model/service.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/model/store_owner.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class ApiService {
  // static const String baseUrl = 'https://api.harrysalon.me';
  static const String baseUrl = 'http://192.168.1.5:3000';
  static const String _login = '/auth/owners/signin';
  static const String _register = '/auth/users/signup';
  // static const String _logout = '/auth/owners/signout';
  static const String _store = '/stores';
  static const String _employee = '/employees';
  static const String _hairstyle = '/hairstyles';
  static const String _payslip = '/payslips';
  static const String _commodity = '/commodity';
  static const String _service = '/services';
  static const String _review = '/reviews';
  static const String _loginEmployee = '/auth/employees/signin';
  static const String _loginCustomer = '/auth/users/signin';
  static const String _detailUser = '/users';
  static const String _owner = '/owners';
  static const String _order = '/orders';
  static const String _favorite = '/favorites';
  static const String _history = '/histories/orders';
  static const String _qrCode = '/presence';

  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isOwner => actor == 'owner';
  bool get isEmployee => actor == 'employee';
  bool get isCustomer => actor == 'customer';

  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_register'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'address': address,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.body);
      return RegisterResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      isOwner
          ? Uri.parse('$baseUrl$_login')
          : isCustomer
              ? Uri.parse('$baseUrl$_loginCustomer')
              : Uri.parse('$baseUrl$_loginEmployee'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<LoginResponse> loginEmployee({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_loginEmployee'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> addStore(
    String token,
    List<List<int>> images,
    List<String> filenames,
    String name,
    String description,
    String location,
    double latitude,
    double longitude,
    TimeOfDay openAt,
    TimeOfDay closeAt,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$_store'),
    );

    for (int i = 0; i < images.length; i++) {
      var multipartFile = http.MultipartFile.fromBytes(
        'images',
        images[i],
        filename: filenames[i],
      );
      request.files.add(multipartFile);
    }

    request.fields.addAll({
      'name': name,
      'description': description,
      'location': location,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'openAt': '${openAt.hour}:${openAt.minute}',
      'closeAt': '${closeAt.hour}:${closeAt.minute}',
    });

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to upload store: ${response.reasonPhrase}');
    }
  }

  Future<StoreResponse> getAllStore({
    required String token,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_store?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return StoreResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load store');
    }
  }

  Future<StoreOwnerResponse> getAllOwnerStore({
    required String token,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_store/all?q=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return StoreOwnerResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load store');
    }
  }

  Future<DetailStoreResponse> getDetailStore({
    required String token,
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_store/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return DetailStoreResponse.fromJson(jsonDecode(response.body));
    } else {
      throw DetailStoreResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateStore({
    required String token,
    required String id,
    List<List<int>>? images,
    List<String>? filenames,
    String? name,
    String? description,
    String? location,
    double? latitude,
    double? longitude,
    TimeOfDay? openAt,
    TimeOfDay? closeAt,
    List<String>? deletedImages,
  }) async {
    var request =
        http.MultipartRequest('PUT', Uri.parse('$baseUrl$_store/$id'));

    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        var multipartFile = http.MultipartFile.fromBytes(
          'images',
          images[i],
          filename: filenames![i],
        );
        request.files.add(multipartFile);
      }
    }

    if (name != null) request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (location != null) request.fields['location'] = location;
    if (latitude != null) request.fields['latitude'] = latitude.toString();
    if (longitude != null) request.fields['longitude'] = longitude.toString();
    if (openAt != null) {
      request.fields['openAt'] = '${openAt.hour}:${openAt.minute}';
    }
    if (closeAt != null) {
      request.fields['closeAt'] = '${closeAt.hour}:${closeAt.minute}';
    }
    if (deletedImages != null) {
      request.fields['deletedImagesId'] = deletedImages.join(',');
    }

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    });

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> deleteStore(
      {required String token, required String id}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$_store/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      throw UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<EmployeeResponse> getAllEmployee({
    required String token,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_employee/all?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return EmployeeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }

  Future<DetailEmployeeResponse> getDetailEmployee({
    required String token,
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_employee/owner/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return DetailEmployeeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw DetailEmployeeResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createEmployee(
    String token,
    String name,
    String address,
    String storeId,
    String phone,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_employee'),
      body: jsonEncode(<String, String>{
        'name': name,
        'address': address,
        'storeId': storeId,
        'phone': phone,
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<EmployeeResponse> getEmployeeByStore({
    required String token,
    required String storeId,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl$_employee/store/$storeId?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return EmployeeResponse.fromJson(jsonDecode(response.body));
    } else {
      return EmployeeResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> deleteEmployee({
    required String token,
    required String id,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$_employee/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<HairstyleResponse> getAllHairstyle({
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_hairstyle?name=$name&page=$page&pageSize=$size'),
    );

    if (response.statusCode == 200) {
      return HairstyleResponse.fromJson(jsonDecode(response.body));
    } else {
      return HairstyleResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailHairstyleResponse> getDetailHairstyle({
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_hairstyle/$id'),
    );

    if (response.statusCode == 200) {
      return DetailHairstyleResponse.fromJson(jsonDecode(response.body));
    } else {
      return DetailHairstyleResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> addHairstyle(
    String token,
    String name,
    String description,
    List<List<int>> images,
    List<String> filenames,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$_hairstyle'),
    );

    for (int i = 0; i < images.length; i++) {
      var multipartFile = http.MultipartFile.fromBytes(
        'image',
        images[i],
        filename: filenames[i],
      );
      request.files.add(multipartFile);
    }

    request.fields.addAll({
      'name': name,
      'description': description,
    });

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateHairstyle({
    required String token,
    required String id,
    List<List<int>>? images,
    List<String>? filenames,
    String? name,
    String? description,
    List<String>? deletedImages,
  }) async {
    var request =
        http.MultipartRequest('PUT', Uri.parse('$baseUrl$_hairstyle/$id'));

    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        var multipartFile = http.MultipartFile.fromBytes(
          'image',
          images[i],
          filename: filenames![i],
        );
        request.files.add(multipartFile);
      }
    }

    if (name != null) request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (deletedImages != null) {
      request.fields['deletedImagesId'] = deletedImages.join(',');
    }

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    });

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> deleteHairstyle({
    required String token,
    required String id,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$_hairstyle/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<PayslipResponse> getPayslip({
    required String token,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      isOwner
          ? Uri.parse('$baseUrl$_payslip?name=$name&page=$page&pageSize=$size')
          : Uri.parse(
              '$baseUrl$_payslip/employee?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return PayslipResponse.fromJson(jsonDecode(response.body));
    } else {
      return PayslipResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createPayslip(
    String token,
    List<int> images,
    String filenames,
    String name,
    String employeeId,
    int total,
    DateTime date,
    List<SubDetailPayslip> earnings,
    List<SubDetailPayslip> deductions,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$_payslip'),
    );

    var multipartFile = http.MultipartFile.fromBytes(
      'attachment',
      images,
      filename: filenames,
    );
    request.files.add(multipartFile);

    request.fields.addAll({
      'name': name,
      'employeeId': employeeId,
      'total': total.toString(),
      'date': date.toIso8601String(),
      'earnings': jsonEncode(earnings),
      'deductions': jsonEncode(deductions),
    });

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailPayslipResponse> getDetailPayslip({
    required String token,
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_payslip/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return DetailPayslipResponse.fromJson(jsonDecode(response.body));
    } else {
      return DetailPayslipResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<CommodityResponse> getCommodity({
    required String token,
    required String storeId,
    String name = '',
    String category = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl$_commodity/store/$storeId?name=$name&category=$category&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return CommodityResponse.fromJson(jsonDecode(response.body));
    } else {
      return CommodityResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailCommodityResponse> getDetailCommodity({
    required String token,
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_commodity/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return DetailCommodityResponse.fromJson(jsonDecode(response.body));
    } else {
      return DetailCommodityResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createCommodity(
    String token,
    List<int> images,
    String filenames,
    String name,
    String storeId,
    String stock,
    String category,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$_commodity'),
    );

    var multipartFile = http.MultipartFile.fromBytes(
      'image',
      images,
      filename: filenames,
    );
    request.files.add(multipartFile);

    request.fields.addAll({
      'name': name,
      'storeId': storeId,
      'stock': stock,
      'category': category,
    });

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateCommodity({
    required String token,
    required String id,
    List<int>? images,
    String? filenames,
    String? name,
    String? stock,
    String? category,
  }) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('$baseUrl$_commodity/$id'),
    );

    if (images != null) {
      var multipartFile = http.MultipartFile.fromBytes(
        'image',
        images,
        filename: filenames,
      );
      request.files.add(multipartFile);
    }

    if (name != null) request.fields['name'] = name;
    if (stock != null) request.fields['stock'] = stock;
    if (category != null) request.fields['category'] = category;

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateCommodityStock({
    required String token,
    required String id,
    required int stock,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl$_commodity/$id'),
      body: jsonEncode(<String, int>{
        'stock': stock,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<ServiceResponse> getAllService({
    required String token,
    required String storeId,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl$_service/store/$storeId?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return ServiceResponse.fromJson(jsonDecode(response.body));
    } else {
      return ServiceResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createService(
    String token,
    List<int> images,
    String filenames,
    String name,
    String price,
    String duration,
    String storeId,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl$_service'),
    );

    var multipartFile = http.MultipartFile.fromBytes(
      'image',
      images,
      filename: filenames,
    );
    request.files.add(multipartFile);

    request.fields.addAll({
      'name': name,
      'price': price,
      'duration': duration,
      'storeId': storeId,
    });

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateService({
    required String token,
    required String id,
    List<int>? images,
    String? filenames,
    String? name,
    String? price,
    String? duration,
  }) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('$baseUrl$_service/$id'),
    );

    if (images != null) {
      var multipartFile = http.MultipartFile.fromBytes(
        'image',
        images,
        filename: filenames,
      );
      request.files.add(multipartFile);
    }

    if (name != null) request.fields['name'] = name;
    if (price != null) request.fields['price'] = price;
    if (duration != null) request.fields['duration'] = duration;

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> deleteService({
    required String token,
    required String id,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$_service/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateStatusStore({
    required String token,
    required String id,
    required bool isActive,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl$_store/$id'),
      body: jsonEncode(<String, String>{
        'status': isActive.toString(),
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<ReviewResponse> getAllReview({
    required String token,
    required String storeId,
    required String rating,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl$_review/store/$storeId?rating=$rating&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return ReviewResponse.fromJson(jsonDecode(response.body));
    } else {
      return ReviewResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createReview({
    required String token,
    required String storeId,
    required String comment,
    required String rating,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_review'),
      body: jsonEncode(<String, String>{
        'storeId': storeId,
        'comment': comment,
        'rating': rating,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailUserResponse> getDetailUser({
    required String token,
  }) async {
    String url = '';

    if (isCustomer) {
      url = '$baseUrl$_detailUser/detail';
    } else if (isEmployee) {
      url = '$baseUrl$_employee/detail';
    } else {
      url = '$baseUrl$_owner/detail';
    }
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return DetailUserResponse.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.body);
      throw DetailUserResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateImageProfile({
    required String token,
    required List<int> images,
    required String filename,
  }) async {
    String url = '';

    if (isCustomer) {
      url = '$baseUrl$_detailUser';
    } else if (isEmployee) {
      url = '$baseUrl$_employee';
    } else {
      url = '$baseUrl$_owner';
    }

    var request = http.MultipartRequest('PUT', Uri.parse(url));

    if (images.isNotEmpty) {
      var multipartFile = http.MultipartFile.fromBytes(
        'avatar',
        images,
        filename: filename,
      );
      request.files.add(multipartFile);
    }

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    });

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      throw UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateProfile({
    required String token,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
  }) async {
    String url = '';

    if (isCustomer) {
      url = '$baseUrl$_detailUser';
    } else if (isEmployee) {
      url = '$baseUrl$_employee';
    } else {
      url = '$baseUrl$_owner';
    }

    var request = http.MultipartRequest('PUT', Uri.parse(url));

    if (name != null) request.fields['name'] = name;
    if (email != null) request.fields['email'] = email;
    if (address != null) request.fields['address'] = address;
    if (phoneNumber != null) request.fields['phone'] = phoneNumber;

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    });

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<OrderResponse> getCurrentOrder({
    required String token,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_order?current=true&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(jsonDecode(response.body));
    } else {
      return OrderResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<DetailOrderResponse> getDetailOrder({
    required String token,
    required String id,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_order/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return DetailOrderResponse.fromJson(jsonDecode(response.body));
    } else {
      return DetailOrderResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> updateStatusOrder({
    required String token,
    required String id,
    String? status,
    bool? isOnLocation,
    bool? isAccepted,
    String? employeeId,
  }) async {
    Map<String, dynamic> body = {};
    if (status != null) {
      body['status'] = status;
    } else if (isOnLocation != null) {
      body['isOnLocation'] = isOnLocation;
    } else if (isAccepted != null) {
      body['isAccepted'] = isAccepted;
      body['employeeId'] = employeeId;
    }

    final response = await http.put(
      Uri.parse('$baseUrl$_order/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createOrder({
    required String token,
    required String storeId,
    required String serviceId,
    required String description,
    required String hairstyleId,
    required String date,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_order'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'storeId': storeId,
        'serviceId': serviceId,
        'description': description,
        'hairstyleId': hairstyleId,
        'date': date,
      }),
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<OrderResponse> getOrderEmployee({
    required String token,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_order/employee?&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return OrderResponse.fromJson(jsonDecode(response.body));
    } else {
      return OrderResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<QueueResponse> getQueue({
    required String token,
    required String storeId,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_order/time/$storeId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return QueueResponse.fromJson(jsonDecode(response.body));
    } else {
      throw QueueResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<FavoriteResponse> getFavorite({
    required String token,
    String? name,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_favorite?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return FavoriteResponse.fromJson(jsonDecode(response.body));
    } else {
      throw FavoriteResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createFavorite({
    required String token,
    required String hairstyleId,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_favorite'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'hairstyleId': hairstyleId,
      }),
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> deleteFavorite({
    required String token,
    required String id,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$_favorite/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UploadResponse.fromJson(jsonDecode(response.body));
    } else {
      return UploadResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<OrderHistoryResponse> getOrderHistory({
    required String token,
    int page = 1,
    int size = 10,
    String storeId = '',
    String dateStart = '',
    String dateEnd = '',
  }) async {
    String url = '';
    if (isOwner) {
      url =
          '$baseUrl$_history/store/$storeId?page=$page&pageSize=$size&dateStart=$dateStart&dateEnd=$dateEnd';
    } else if (isEmployee) {
      url = '$baseUrl$_history/employee/?page=$page&pageSize=$size';
    } else {
      url = '$baseUrl$_history/user/?page=$page&pageSize=$size';
    }
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return OrderHistoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw OrderHistoryResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<QrCodeResponse> getQrCode({
    required String token,
    required String storeId,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_qrCode/qr/$storeId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return QrCodeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw QrCodeResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<UploadResponse> createPresence({
    required String token,
    required String code,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$_qrCode'),
        body: jsonEncode(<String, String>{
          'token': code,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return UploadResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create presence: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }

  Future<PresenceResponse> getAttendace({
    required String token,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_qrCode?page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return PresenceResponse.fromJson(jsonDecode(response.body));
    } else {
      throw PresenceResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<PresenceResponse> getAttendaceByOwner({
    required String token,
    required String employeeId,
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_qrCode/$employeeId?page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return PresenceResponse.fromJson(jsonDecode(response.body));
    } else {
      throw PresenceResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<PayslipResponse> getPayslipEmployeeByOwner({
    required String token,
    required String employeeId,
    String name = '',
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl$_payslip/employee/$employeeId?name=$name&page=$page&pageSize=$size'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return PayslipResponse.fromJson(jsonDecode(response.body));
    } else {
      return PayslipResponse.fromJson(jsonDecode(response.body));
    }
  }
}
