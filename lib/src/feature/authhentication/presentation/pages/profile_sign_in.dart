import 'package:chat/src/config/router/router.gr.dart';
import 'package:chat/src/core/widgets/button.dart';
import 'package:chat/src/core/widgets/custom_text_field.dart';
import 'package:chat/src/feature/authhentication/domain/usecases/user.dart';
import 'package:chat/src/feature/authhentication/presentation/bloc/profile_regist_state.dart';
import 'package:chat/src/feature/authhentication/presentation/bloc/profile_registr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
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
          title: const Text("Sign In"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Email Input
              BlocBuilder<ProfileRegistrCubit, ProfileState>(
                builder: (context, state) {
                  return CustomTextField(
                    labelText: "Email",
                    controller: _emailController,
                    onChanged: (value) =>
                        context.read<ProfileRegistrCubit>().updateEmail(value),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Password Input
              BlocBuilder<ProfileRegistrCubit, ProfileState>(
                builder: (context, state) {
                  return CustomTextField(
                    labelText: "Password",
                    controller: _passwordController,
                    onChanged: (value) => context
                        .read<ProfileRegistrCubit>()
                        .updatePassword(value),
                  );
                },
              ),
              const SizedBox(height: 32),

              TextButton(
                onPressed: () {
                  context.router.push(const SignUpRoute());
                },
                child: const Text("Don't have an account? Sign Up"),
              ),

              // Sign-In Button
              BlocConsumer<ProfileRegistrCubit, ProfileState>(
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error!)),
                    );
                  } else if (!state.isLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sign-in successful!")),
                    );

                    // Clear fields after successful sign-in
                    _emailController.clear();
                    _passwordController.clear();
                  }
                },
                builder: (context, state) {
                  return state.isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Sign In",
                          width: double.infinity,
                          height: 50,
                          fontSize: 16,
                          onTap: () {
                            final cubit = context.read<ProfileRegistrCubit>();
                            cubit.signInUser(
                              RepositoryProvider.of<SignInUseCase>(context),
                            );
                          },
                        );
                },
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
