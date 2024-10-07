import 'dart:convert'; // Base64エンコーディング用
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key); // Added Key parameter

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
        final bytes = await image.readAsBytes();
        setState(() {
          _base64Image = base64Encode(bytes); // Base64形式にエンコード
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
    if (_isTextFieldNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'dateTime': DateTime.now().toString(),
        'text': _controller.text,
        'image': _base64Image,
      });
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFFFD4B4)),
                  onPressed: () => Navigator.pop(context),
                ),
                Container(
                  width: 86,
                  height: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isTextFieldNotEmpty
                          ? Color(0xFFFFB37B)
                          : Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isTextFieldNotEmpty ? _submitPost : null,
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
                    ? Icon(Icons.image, size: 50, color: Colors.white)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          base64Decode(_base64Image!),
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
