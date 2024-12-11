import 'package:chat/src/config/router/router.gr.dart';
import 'package:chat/src/core/constants/image.dart';
import 'package:chat/src/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
                height: 270,
              ),
              const SizedBox(height: 20),
              const Text(
                'Connect easily with your family and friends worldwide with Void',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Start Messaging',
                width: MediaQuery.of(context).size.width * 0.8,
                height: 52,
                fontSize: 16,
                onTap: () {
                  context.router.push(SignInRoute());
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
