import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    fontFamily: 'Kiwi Maru',
    scaffoldBackgroundColor: Color(0xFFFFFAF3),
    primaryColor: Color(0xFFFFB37B),
    secondaryHeaderColor: Color(0xFFFFD4B4),
    // テキストテーマの設定
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFF505B64),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF72828E),
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF505B64),
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        color: Color(0xFF505B64),
      ),
    ),
    // ボタンスタイルの設定
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // 通常時のボタンの背景色
        foregroundColor: Color(0xFF505B64), // 通常時のボタンのテキスト色
        elevation: 0, // 通常時の影の設定
        textStyle: TextStyle(
          fontFamily: 'Kiwi Maru',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: Size(double.infinity, 60),
      ).copyWith(
        // 押下中のスタイル
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(0xFFF6F6F6); // 押下時の背景色
            }
            return null; // デフォルトの背景色
          },
        ),
        elevation: MaterialStateProperty.all(0), // 押下中の影を設定
      ),
    ),
  );
}
