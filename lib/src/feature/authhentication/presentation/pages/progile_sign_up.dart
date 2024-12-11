import 'package:chat/src/core/widgets/button.dart';
import 'package:chat/src/core/widgets/custom_text_field.dart';
import 'package:chat/src/core/widgets/profile_avatar.dart';
import 'package:chat/src/feature/authhentication/domain/usecases/user.dart';
import 'package:chat/src/feature/authhentication/presentation/bloc/profile_regist_state.dart';
import 'package:chat/src/feature/authhentication/presentation/bloc/profile_registr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileRegistrCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Avatar Picker
              ProfileAvatar(
                onTap: () {
                  print("Avatar tapped");
                },
              ),

              // Username Input
              CustomTextField(
                labelText: "Username",
                controller: _usernameController,
                onChanged: (value) =>
                    context.read<ProfileRegistrCubit>().updateUsername(value),
              ),

              const SizedBox(height: 16),

              // Email Input
              CustomTextField(
                labelText: "Email",
                controller: _emailController,
                onChanged: (value) =>
                    context.read<ProfileRegistrCubit>().updateEmail(value),
              ),

              const SizedBox(height: 16),

              // Password Input
              CustomTextField(
                labelText: "Password",
                controller: _passwordController,
                onChanged: (value) =>
                    context.read<ProfileRegistrCubit>().updatePassword(value),
              ),

              const SizedBox(height: 32),

              // Submit Button
              BlocConsumer<ProfileRegistrCubit, ProfileState>(
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error!)),
                    );
                  } else if (!state.isLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Registration successful!"),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Register",
                          width: double.infinity,
                          height: 50,
                          fontSize: 16,
                          onTap: () {
                            final cubit = context.read<ProfileRegistrCubit>();
                            cubit.registerUser(
                              RepositoryProvider.of<SignUpUseCase>(context),
                              supertokensId:
                                  "dynamic_supertokens_id", // Provide real value
                              avatarUrl:
                                  "dynamic_avatar_url", // Provide real value
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
