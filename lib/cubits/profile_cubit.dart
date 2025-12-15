import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileState(
          user: const User(
            name: 'John Doe',
            email: 'john@example.com',
            avatar: 'assets/images/products/product1.png',
          ),
        ),
      );

  void updateUser(User newUser) {
    emit(state.copyWith(user: newUser));
  }
}
