import 'dart:io';

import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';

abstract class RemoteDataSource {
  // Credential
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();

  // User
  Stream<List<UserEntity>> getUsers(UserEntity user);
  Stream<List<UserEntity>> getSingleUser(String uid);
  Future<String> getCurrentUid();
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);

  // Could Storage
  Future<String> uploadImageToStorage(File fiel, bool isPost, String childName);
}
