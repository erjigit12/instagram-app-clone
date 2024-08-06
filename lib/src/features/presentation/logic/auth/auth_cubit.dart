import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/get_current_uid_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/is_sign_in_usecase.dart';
import 'package:instagram_app_clone/src/features/domain/usecases/firebase_usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUsecase signOutUsecase;
  final IsSignInUsecase isSignInUsecase;
  final GetCurrrentUidUsecase getCurrrentUidUsecase;

  AuthCubit({
    required this.signOutUsecase,
    required this.isSignInUsecase,
    required this.getCurrrentUidUsecase,
  }) : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUsecase.call();
      if (isSignIn == true) {
        final uid = await getCurrrentUidUsecase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrrentUidUsecase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUsecase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
