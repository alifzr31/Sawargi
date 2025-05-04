import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sawargi/app/configs/dio/dio_client.dart';
import 'package:sawargi/app/models/anggota_kependudukan.dart';
import 'package:sawargi/app/utils/end_point.dart';

class AuthService extends DioClient {
  Future<AnggotaKependudukan?> checkAnggotaKependudukanByNik({
    String? nik,
  }) async {
    try {
      final response = await post(
        EndPoint.checkAnggotaKependudukanByNik,
        data: {'nik': nik},
      );

      return response.data['data']['nik'] == null
          ? null
          : await compute(
            (message) => anggotaKependudukanFromJson(message),
            response.data['data'],
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register({
    String? nik,
    String? name,
    String? password,
  }) async {
    try {
      final response = await post(
        EndPoint.register,
        data: {'id': '98', 'nik': nik, 'name': name, 'password': password},
      );

      return await compute((message) => message, response);
    } catch (e) {
      rethrow;
    }
  }
}
