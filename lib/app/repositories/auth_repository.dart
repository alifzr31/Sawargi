import 'package:dio/dio.dart';
import 'package:sawargi/app/models/anggota_kependudukan.dart';
import 'package:sawargi/app/services/auth_service.dart';

abstract class AuthRepository {
  Future<AnggotaKependudukan?> checkAnggotaKependudukanByNik({String? nik});
  Future<Response> register({String? nik, String? name, String? password});
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service;

  AuthRepositoryImpl(this._service);

  @override
  Future<AnggotaKependudukan?> checkAnggotaKependudukanByNik({
    String? nik,
  }) async {
    return await _service.checkAnggotaKependudukanByNik(nik: nik);
  }

  @override
  Future<Response> register({
    String? nik,
    String? name,
    String? password,
  }) async {
    return await _service.register(nik: nik, name: name, password: password);
  }
}
