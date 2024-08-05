import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class SignUpUsecase {
  final FirebaseRepository repository;

  const SignUpUsecase({required this.repository});

  Future<void> call(UserEntity userEntity) {
    return repository.signUpUser(userEntity);
  }
}
