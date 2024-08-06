import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/get_users_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUsecase getUsersUsecase;
  final UpdateUserUsecase updateUserUsecase;

  UserCubit({
    required this.getUsersUsecase,
    required this.updateUserUsecase,
  }) : super(UserInitial());

  Future<void> getUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      final streamResponse = getUsersUsecase.call(user);
      streamResponse.listen((users) {
        emit(UserSuccess(users: users));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      await updateUserUsecase.call(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
