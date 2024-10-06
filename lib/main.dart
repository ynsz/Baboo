import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/start_screen.dart';
import 'screens/main_screen.dart';
import 'screens/post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baboo',
      theme: AppTheme.light,
      initialRoute: '/', // 最初はStartScreenから始まる
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            switch (settings.name) {
              case '/':
                return StartScreen();
              case '/main':
                return MainScreen();
              case '/post':
                return PostScreen();
              default:
                return MainScreen(); // デフォルトはMainScreen
            }
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeOut;

            final tween = Tween(begin: begin, end: end);
            final opacityAnimation =
                animation.drive(tween.chain(CurveTween(curve: curve)));

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
          transitionDuration:
              const Duration(milliseconds: 300), // 300msのフェードアニメーション
        );
      },
    );
  }
}
