import 'dart:convert'; // Base64エンコーディング用
import 'dart:html' as html; // Dart HTMLライブラリをインポート
import 'dart:typed_data'; // Uint8Listの使用
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController _controller = TextEditingController();
  bool _isTextFieldNotEmpty = false;
  String? _base64Image; // Base64形式の画像データを保持

  final ImagePicker _picker = ImagePicker(); // 画像ピッカーのインスタンス

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextFieldNotEmpty = _controller.text.isNotEmpty;
      });
    });
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // 画像をBase64に変換
        final reader = html.FileReader();
        final blob = html.Blob([await html.window.fetch(image.path).then((response) => response.arrayBuffer())]); // Blobを作成
        reader.readAsArrayBuffer(blob); // FileReaderを使ってバイトを読み込む

        reader.onLoadEnd.listen((e) {
          final bytes = reader.result as Uint8List; // 読み込んだデータをUint8Listに変換
          setState(() {
            _base64Image = base64Encode(bytes); // Base64形式にエンコード
          });
        });
      }
    } catch (e) {
      // エラー発生時の処理
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('画像選択中にエラーが発生しました')),
      );
    }
  }

  void _submitPost() {
    // 投稿処理のロジックを追加
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('投稿が成功しました')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 両端揃え
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFFFD4B4)), // 矢印の色を設定
                  onPressed: () => Navigator.pop(context),
                ),
                // 投稿ボタンを右揃えにするためにContainerでラップ
                Container(
                  width: 140, // ボタンの幅
                  height: 50, // ボタンの高さ
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isTextFieldNotEmpty ? Color(0xFFFFB37B) : Colors.grey, // プライマリーカラーまたはグレー
                      foregroundColor: Colors.white, // 文字色を白に設定
                    ),
                    onPressed: _isTextFieldNotEmpty ? _submitPost : null, // 投稿処理
                    child: Text('投稿する'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Color(0xFFFFE5D1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _base64Image == null
                    ? Icon(Icons.image, size: 50, color: Colors.white) // アイコン色を白に設定
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          base64Decode(_base64Image!), // Base64データをデコードして表示
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'あなたの赤ちゃんになったつもりで今日のできごとを書いてね。',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
