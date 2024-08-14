import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_app_clone/src/features/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:instagram_app_clone/src/features/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:instagram_app_clone/src/features/data/repository/firebase_repo_impl.dart';
import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/create_user_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/get_current_uid_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/get_single_user_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/get_users_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/is_sign_in_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/sign_in_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/sign_out_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/sign_up_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/update_user_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/storage/upload_image_to_storage_usecase.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/auth/auth_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/credential/credential_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/user/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
        signOutUsecase: sl.call(),
        isSignInUsecase: sl.call(),
        getCurrrentUidUsecase: sl.call()),
  );

  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
      signInUsecase: sl.call(),
      signUpUsecase: sl.call(),
    ),
  );

  sl.registerFactory<UserCubit>(
    () => UserCubit(
      getUsersUsecase: sl.call(),
      updateUserUsecase: sl.call(),
    ),
  );

  sl.registerFactory<GetSingleUserCubit>(
    () => GetSingleUserCubit(getSingleUserUsecase: sl.call()),
  );

  // Use Cases
  // User
  sl.registerLazySingleton(() => SignOutUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrrentUidUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUsecase(repository: sl.call()));

  // Cloud Storage
  sl.registerLazySingleton(
      () => UploadImageToStorageUsecase(repository: sl.call()));

  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
      firebaseFirestore: sl.call(), firebaseAuth: sl.call()));

  // Externals
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
}
