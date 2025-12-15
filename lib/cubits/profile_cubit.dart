import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileState(
          user: const User(
            name: 'Thu Phuong',
            email: 'tp@example.com',
            avatar: 'assets/images/carrot.png',
          ),
        ),
      );

  void updateUser(User newUser) {
    emit(state.copyWith(user: newUser));
  }
}
