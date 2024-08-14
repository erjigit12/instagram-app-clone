import 'dart:io';

import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class UploadImageToStorageUsecase {
  final FirebaseRepository repository;

  const UploadImageToStorageUsecase({required this.repository});

  Future<String> call(File file, bool isPost, String childName) {
    return repository.uploadImageToStorage(file, isPost, childName);
  }
}
