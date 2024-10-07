import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_avatar.dart';
import 'package:uicons/uicons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 現在のインデックスを保持

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // タップされたインデックスを更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: HeaderAvatar(),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'まずは「+」ボタンから\n投稿してみてね。',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF505B64), fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/post');
          },
          backgroundColor: Color(0xFFFFB37B),
          elevation: 0,
          hoverElevation: 0,
          shape: CircleBorder(),
          child: Icon(
            UIcons.solidRounded.plus,
            size: 20.0,
            color: Colors.white,
          ),
          highlightElevation: 0,
          focusColor: Color(0xFFFFD4B4),
          hoverColor: Color(0xFFFFB37B),
          splashColor: Color(0xFFFFD4B4),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex, // 現在のインデックスを渡す
        onTap: _onItemTapped, // アイテムがタップされたときに実行するコールバック
      ),
    );
  }
}
