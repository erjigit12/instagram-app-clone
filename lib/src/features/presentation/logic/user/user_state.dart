part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

final class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

final class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

final class UserSuccess extends UserState {
  final List<UserEntity> users;

  const UserSuccess({required this.users});

  @override
  List<Object> get props => [users];
}

final class UserFailure extends UserState {
  @override
  List<Object> get props => [];
}
