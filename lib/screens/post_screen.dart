import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('赤ちゃんの視点で投稿'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'あなたの赤ちゃんになったつもりで投稿してね。',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/sample_baby.jpg'), // 画像のパス
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'ここに投稿内容を書く',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('投稿が完了しました');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // 修正
              ),
              child: Text('投稿する'),
            ),
          ],
        ),
      ),
    );
  }
}
