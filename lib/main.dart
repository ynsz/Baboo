import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/start_screen.dart';
import 'screens/home_screen.dart'; // HomeScreen のインポート
import 'screens/post_screen.dart';
import 'screens/calendar_screen.dart'; // CalendarScreen のインポート
import 'screens/setting_screen.dart'; // SettingScreen のインポート

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
        Widget page;
        switch (settings.name) {
          case '/':
            page = StartScreen();
            break;
          case '/main':
            page = HomeScreen(); // メイン画面をHomeScreenとして設定
            break;
          case '/post':
            page = PostScreen();
            break;
          case '/calendar':
            page = CalendarScreen(); // カレンダー画面
            break;
          case '/settings':
            page = SettingScreen(); // 設定画面
            break;
          default:
            page = HomeScreen(); // デフォルトはHomeScreen
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeOut;

            final tween = Tween(begin: begin, end: end);
            final fadeAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300), // 300msのフェードアニメーション
        );
      },
    );
  }
}
