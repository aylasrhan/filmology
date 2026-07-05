import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:filmology/features/auth/data/repositories/auth_repository.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final response = await authRepository.login(
        email: email,
        password: password,
      );

      emit(AuthSuccess(response.message ?? "تم الدخول بنجاح"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(AuthLoading());
    try {
      final response = await authRepository.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      emit(AuthSuccess(response.message ?? "تم إنشاء الحساب بنجاح"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
