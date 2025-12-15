import '../models/user.dart';

class ProfileState {
  final User user;

  const ProfileState({required this.user});

  ProfileState copyWith({User? user}) {
    return ProfileState(user: user ?? this.user);
  }
}
