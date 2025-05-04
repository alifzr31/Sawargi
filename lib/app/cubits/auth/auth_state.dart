part of 'auth_cubit.dart';

enum NikStatus { initial, loading, success, error }

enum RegisterStatus { initial, loading, success, error }

enum LoginStatus { initial, loading, success, error }

class AuthState extends Equatable {
  final NikStatus nikStatus;
  final AnggotaKependudukan? anggotaKependudukan;
  final dynamic nikError;
  final RegisterStatus registerStatus;
  final Response? registerResponse;
  final dynamic registerError;
  final LoginStatus loginStatus;
  final Response? loginResponse;
  final dynamic loginError;

  const AuthState({
    this.nikStatus = NikStatus.initial,
    this.anggotaKependudukan,
    this.nikError,
    this.registerStatus = RegisterStatus.initial,
    this.registerResponse,
    this.registerError,
    this.loginStatus = LoginStatus.initial,
    this.loginResponse,
    this.loginError,
  });

  AuthState copyWith({
    NikStatus? nikStatus,
    AnggotaKependudukan? anggotaKependudukan,
    dynamic nikError,
    RegisterStatus? registerStatus,
    Response? registerResponse,
    dynamic registerError,
    LoginStatus? loginStatus,
    Response? loginResponse,
    dynamic loginError,
  }) {
    return AuthState(
      nikStatus: nikStatus ?? this.nikStatus,
      anggotaKependudukan: anggotaKependudukan,
      nikError: nikError ?? this.nikError,
      registerStatus: registerStatus ?? this.registerStatus,
      registerResponse: registerResponse,
      registerError: registerError ?? this.registerError,
      loginStatus: loginStatus ?? this.loginStatus,
      loginResponse: loginResponse,
      loginError: loginError ?? this.loginError,
    );
  }

  @override
  List<Object?> get props => [
    nikStatus,
    anggotaKependudukan,
    nikError,
    registerStatus,
    registerResponse,
    registerError,
    loginStatus,
    loginResponse,
    loginError,
  ];
}
