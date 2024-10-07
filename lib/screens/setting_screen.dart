import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart'; // ナビゲーションバーの共通モジュール
import '../widgets/header_avatar.dart'; // ヘッダーウィジェットをインポート

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _selectedIndex = 2; // 設定画面のインデックス

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // タップされたインデックスを更新
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/main'); // ホーム画面へ遷移
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/calendar'); // カレンダー画面へ遷移
        break;
      case 2:
        // 設定画面なので何もしない
        break;
    }
  }

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
        child: Text(
          '設定画面です',
          style: TextStyle(color: Color(0xFF505B64), fontSize: 18),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex, // 設定画面のインデックスを渡す
        onTap: _onItemTapped, // アイテムがタップされたときに実行するコールバック
      ),
    );
  }
}
