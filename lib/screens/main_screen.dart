import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart'; // ナビゲーションバーの共通モジュール
import '../widgets/header_avatar.dart'; // ヘッダーウィジェットをインポート

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF3), // 背景色
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // 戻るアイコンを非表示に
        title: HeaderAvatar(), // ヘッダーウィジェットをここで使用
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'まずはここから\n投稿してみて',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF505B64), fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post'); // post_screen.dart への遷移
        },
        backgroundColor: Color(0xFFFFB37B), // プライマリカラー
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0), // 共通モジュールの呼び出し
    );
  }
}
