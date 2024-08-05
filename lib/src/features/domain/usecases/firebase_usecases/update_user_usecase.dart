import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class UpdateUserUsecase {
  final FirebaseRepository repository;

  const UpdateUserUsecase({required this.repository});

  Future<void> call(UserEntity userEntity) {
    return repository.updateUser(userEntity);
  }
}
