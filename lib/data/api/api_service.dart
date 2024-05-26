import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_akhir_app/model/detail_employee.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/model/employee.dart';
import 'package:tugas_akhir_app/model/login.dart';
import 'package:tugas_akhir_app/model/register.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';
  static const String _login = '/auth/owners/signin';
  static const String _register = '/auth/owners/signup';
  // static const String _logout = '/auth/owners/signout';
  static const String _store = '/stores';
  static const String _employee = '/employees';

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
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$_login'),
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
    int page = 1,
    int size = 10,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$_store/all?page=$page&pageSize=$size'),
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
      Uri.parse('$baseUrl$_employee/$id'),
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
}
