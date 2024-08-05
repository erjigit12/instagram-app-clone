import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class IsSignInUsecase {
  final FirebaseRepository repository;

  const IsSignInUsecase({required this.repository});

  Future<bool> call() {
    return repository.isSignIn();
  }
}
