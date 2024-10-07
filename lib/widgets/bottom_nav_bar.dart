import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        onTap(index); // 外部から渡されたコールバックを呼び出す

        // 選択されたインデックスに応じて画面を遷移
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home'); // ホーム画面に遷移
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/calendar'); // カレンダー画面に遷移
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/settings'); // 設定画面に遷移
            break;
        }
      },
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor, 
      unselectedItemColor: Colors.grey[400], 
      items: [
        BottomNavigationBarItem(
          icon: Icon(UIcons.solidRounded.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(UIcons.solidRounded.calendar),
          label: 'カレンダー',
        ),
        BottomNavigationBarItem(
          icon: Icon(UIcons.solidRounded.settings),
          label: '設定',
        ),
      ],
    );
  }
}
