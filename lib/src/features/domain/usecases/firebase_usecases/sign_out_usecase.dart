import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class SignOutUsecase {
  final FirebaseRepository repository;

  const SignOutUsecase({required this.repository});

  Future<void> call() {
    return repository.signOut();
  }
}
