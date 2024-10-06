import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 60,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'サービス利用規約に同意して',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12,
                      ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text('はじめる'),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
