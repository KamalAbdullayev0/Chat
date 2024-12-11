import 'package:chat/src/config/router/router.gr.dart';
import 'package:chat/src/core/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirectToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Фоновое изображение
          Image.asset(
            AppImages.splash,
            fit: BoxFit.cover,
          ),
          // Текст внизу экрана
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'By Kamal',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _redirectToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.router.replaceAll([const StartRoute()]);
    }
  }
}
