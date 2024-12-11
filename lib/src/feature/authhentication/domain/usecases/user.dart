import 'package:chat/src/feature/authhentication/domain/entities/user.dart';

abstract class SignUpUseCase {
  Future<void> call(User user);
}

abstract class SignInUseCase {
  Future<void> call({required String email, required String password});
}
