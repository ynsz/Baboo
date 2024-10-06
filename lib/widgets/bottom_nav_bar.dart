import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNavBar({Key? key, required this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ほーむ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'かんれんだー',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'せってい',
        ),
      ],
      selectedItemColor: Color(0xFFFFB37B), // プライマリカラー
      unselectedItemColor: Color(0xFF72828E), // セカンダリカラー
      currentIndex: currentIndex, // 現在のインデックス
      onTap: onTap,
    );
  }
}
