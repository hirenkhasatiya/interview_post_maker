import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2800,
      splash: Stack(
        children: [
          Center(
              child: Transform.scale(
            scale: 3,
            child: Image.asset(
              'assets/applogo.png',
            ),
          )),
          Align(
            alignment: const FractionalOffset(0.5, 3.8),
            child: Transform.scale(
              scale: 2,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "POSTMAKERAPP",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      nextScreen: const HomePage(),
    );
  }
}
