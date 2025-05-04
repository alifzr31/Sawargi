import 'package:get_it/get_it.dart';
import 'package:sawargi/app/cubits/auth/auth_cubit.dart';
import 'package:sawargi/app/repositories/auth_repository.dart';
import 'package:sawargi/app/services/auth_service.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerFactory(() => AuthCubit(sl()));
}
