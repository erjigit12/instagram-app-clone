import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';
import 'package:instagram_app_clone/src/features/domain/repository/firebase_repo.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;

  const GetUsersUsecase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity userEntity) {
    return repository.getUsers(userEntity);
  }
}
