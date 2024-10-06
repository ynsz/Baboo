import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/avatar.svg',
          ),
        ),
        SizedBox(width: 10),
        Text(
          'ぼくわたし、赤ちゃん',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
