import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/features/auth/data/model/auth_model.dart';
import 'package:filmology/features/profil1/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthStorageService storageService;

  ProfileCubit({required this.storageService}) : super(ProfileInitial());

  void fetchUserProfile() async {
    emit(ProfileLoading());
    try {
      final String? name = await storageService.getUserName();
      final String? email = await storageService.getUserEmail();
      final int? id = await storageService.getUserId();

      if (name != null || email != null) {
        final userData = UserData(
          id: id,
          name: name,
          email: email,
        );
        emit(ProfileSuccess(userData));
      } else {
        emit(ProfileError("لم يتم العثور على بيانات المستخدم"));
      }
    } catch (e) {
      emit(ProfileError("حدث خطأ أثناء جلب البيانات: ${e.toString()}"));
    }
  }
}