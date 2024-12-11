import 'dart:convert'; // Importing jsonEncode
import 'package:chat/src/core/constants/ulr_const.dart';
import 'package:chat/src/feature/authhentication/data/model/user.dart';
import 'package:chat/src/feature/authhentication/domain/entities/user.dart';
import 'package:chat/src/feature/authhentication/domain/usecases/user.dart';
import 'package:http/http.dart' as http;

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  Future<void> call(User user) async {
    final url = Uri.parse('${UrlConst.baseUrl}/api/v1/user');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(UserModel(
        supertokensId: user.supertokensId,
        username: user.username,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ).toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register user: ${response.body}');
    }
  }
  
}
