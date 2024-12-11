import 'package:chat/src/feature/authhentication/domain/entities/user.dart';
import 'package:chat/src/feature/authhentication/domain/usecases/user.dart';
import 'package:chat/src/feature/authhentication/presentation/bloc/profile_regist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileRegistrCubit extends Cubit<ProfileState> {
  ProfileRegistrCubit() : super(const ProfileState());

  // Update username field
  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  // Update email field
  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  // Update password field
  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  // Register a new user
  Future<void> registerUser(
    SignUpUseCase signUpUseCase, {
    required String supertokensId,
    required String avatarUrl,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));

    final user = User(
      supertokensId: supertokensId,
      username: state.username,
      email: state.email,
      avatarUrl: avatarUrl,
    );

    try {
      await signUpUseCase.call(user);
      emit(state.copyWith(isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // Sign in an existing user
  Future<void> signInUser(SignInUseCase signInUserUseCase) async {
    emit(state.copyWith(isLoading: true, error: null)); // Set loading state

    try {
      await signInUserUseCase(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(
        isLoading: false,
        error: null,
      )); // Reset loading and error on success
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      )); // Emit error message
    }
  }
}
