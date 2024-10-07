import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ステータスバーの高さを取得
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0), // 左右20px、上下40pxのパディングを追加
      child: Padding(
        padding: EdgeInsets.only(top: statusBarHeight), // ステータスバーの高さを考慮
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/avatar.svg',
                height: 42, // アイコンの高さを指定
              ),
            ),
            SizedBox(width: 10),
            Text(
              'ぼくわたし、',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '赤ちゃん',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
