import 'package:flutter/material.dart';
import 'package:poster_editor/Controller/page_controller.dart';
import 'package:poster_editor/Views/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Views/Screens/edit_page.dart';
import 'Views/Screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EditController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        '/': (context) => HomePage(),
        'splash': (context) => SplashScreen(),
        'edit': (context) => EditPage(),
      },
    );
  }
}
