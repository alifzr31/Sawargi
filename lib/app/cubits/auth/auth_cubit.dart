import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sawargi/app/models/anggota_kependudukan.dart';
import 'package:sawargi/app/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  void resetState() {
    emit(
      state.copyWith(
        loginStatus: LoginStatus.initial,
        loginResponse: null,
        loginError: null,
        registerStatus: RegisterStatus.initial,
        registerResponse: null,
        registerError: null,
      ),
    );
  }

  void resetRegisterState() {
    emit(
      state.copyWith(
        nikStatus: NikStatus.initial,
        anggotaKependudukan: null,
        nikError: null,
        registerStatus: RegisterStatus.initial,
        registerResponse: null,
        registerError: null,
      ),
    );
  }

  Future<void> checkAnggotaKependudukanByNik({String? nik}) async {
    emit(state.copyWith(nikStatus: NikStatus.loading));

    try {
      final anggotaKependudukan = await _repository
          .checkAnggotaKependudukanByNik(nik: nik);

      emit(
        state.copyWith(
          nikStatus: NikStatus.success,
          anggotaKependudukan: anggotaKependudukan,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          nikStatus: NikStatus.error,
          nikError:
              e.response?.data['message'] ??
              e.response?.data['errors'] ??
              'Ups sepertinya terjadi kesalahan',
        ),
      );
    }
  }

  void register({String? nik, String? name, String? password}) async {
    emit(
      state.copyWith(
        anggotaKependudukan: state.anggotaKependudukan,
        registerStatus: RegisterStatus.loading,
      ),
    );

    try {
      final response = await _repository.register(
        nik: nik,
        name: name,
        password: password,
      );

      emit(
        state.copyWith(
          anggotaKependudukan: state.anggotaKependudukan,
          registerStatus: RegisterStatus.success,
          registerResponse: response,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          anggotaKependudukan: state.anggotaKependudukan,
          registerStatus: RegisterStatus.error,
          registerError:
              e.response?.data['message'] ??
              e.response?.data['errors'] ??
              'Ups sepertinya terjadi kesalahan',
        ),
      );
    }
  }
}
