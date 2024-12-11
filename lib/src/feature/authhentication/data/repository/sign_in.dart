import 'dart:convert';
import 'package:chat/src/feature/authhentication/domain/usecases/user.dart';
import 'package:http/http.dart' as http;

class SignInUserUseCaseImpl implements SignInUseCase {
  final String baseUrl;

  SignInUserUseCaseImpl(this.baseUrl);

  @override
  Future<void> call({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to sign in: ${response.body}');
    }

    // Optionally, parse the response to retrieve authentication tokens or other data.
  }
}
