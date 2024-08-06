part of 'get_single_user_cubit.dart';

abstract class GetSingleUserState extends Equatable {
  const GetSingleUserState();
}

final class GetSingleUserInitial extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

final class GetSingleUserLoading extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

final class GetSingleUserSuccess extends GetSingleUserState {
  final UserEntity user;

  const GetSingleUserSuccess({required this.user});

  @override
  List<Object> get props => [];
}

final class GetSingleUserFailure extends GetSingleUserState {
  @override
  List<Object> get props => [];
}
