import 'package:get_it/get_it.dart';
import 'package:filmology/core/network/api_consumer.dart';
import 'package:filmology/core/network/api_service.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/features/auth/data/repositories/auth_repository.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:filmology/features/home/data/repositories/home_repository_impl.dart';
import 'package:filmology/features/home/domain/repository/home_repository.dart';
import 'package:filmology/features/home/presentation/cubit/home_cubit.dart';
import 'package:filmology/features/profil1/presentation/cubit/profil_cubit.dart';
import 'package:filmology/features/reviews/data/repositories/review_repository.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AuthStorageService>(() => AuthStorageService());

  getIt.registerSingleton<ApiConsumer>(
    ApiConsumer("https://movie-platform.focal-x.com/api/"),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiConsumer>(), getIt<AuthStorageService>()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));

  getIt.registerSingleton<HomeApiService>(HomeApiService(getIt<ApiConsumer>()));

  getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(getIt<HomeApiService>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<ReviewRepository>(
    () => ReviewRepository(getIt<ApiConsumer>()),
  );

  getIt.registerFactory<ReviewCubit>(
    () => ReviewCubit(getIt<ReviewRepository>()),
  );

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(storageService: getIt<AuthStorageService>()),
  );
}