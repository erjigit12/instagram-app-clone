import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class GetCurrrentUidUsecase {
  final FirebaseRepository repository;

  const GetCurrrentUidUsecase({required this.repository});

  Future<String> call() {
    return repository.getCurrentUid();
  }
}
