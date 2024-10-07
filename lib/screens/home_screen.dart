import 'dart:convert'; // 追加: base64Decodeを使用するためにインポート
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
  List<Map<String, dynamic>> posts = []; // 投稿データを保持するリスト

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // タップされたインデックスを更新
    });
  }

  @override
  Widget build(BuildContext context) {
    // 引数から投稿データを取得
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // 投稿がある場合、データをリストに追加
    if (args != null) {
      posts.add({
        'dateTime': args['dateTime'], // 投稿日時
        'text': args['text'], // テキスト内容
        'image': args['image'], // 画像データ
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFAF3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: HeaderAvatar(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: posts.isEmpty // 投稿がない場合の条件分岐
            ? Center(
                child: Text(
                  'まずは「+」ボタンから\n投稿してみてね。',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF505B64), fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['dateTime'], // 投稿日時の表示
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            post['text'], // 投稿テキストの表示
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          if (post['image'] != null) // 画像がある場合
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                base64Decode(
                                    post['image']), // Base64データをデコードして表示
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
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
