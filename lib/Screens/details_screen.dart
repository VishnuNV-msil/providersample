import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../provider/counter_provider.dart';
import '../provider/Future_provider.dart';
import 'dart:async';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final futureNotifier = Provider.of<FutureNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            futureNotifier.data == null
                ? CircularProgressIndicator()
                : Text(
                    'Data: ${futureNotifier.data}',
                    style: TextStyle(fontSize: 20),
                  ),
            Text(
              'User Clicked the "Increment" button this many times in home screen : ${counter.getCount()}',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                themeNotifier.toggleTheme();
              },
              child: Text('Toggle Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                counter.decrement();
              },
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
