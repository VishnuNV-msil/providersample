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
            Consumer<Counter>(builder: (context, counter, child) {
              return Text(
                'User Clicked the "Increment" button this many times in home screen : ${counter.Count}',
              style: Theme.of(context).textTheme.titleMedium,
              );
            }),
            ElevatedButton(
              onPressed: () {
                Provider.of<ThemeNotifier>(context, listen: false)
                    .toggleTheme();
              },
              child: Text('Toggle Theme',
              style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Counter>(context, listen: false).decrement();
              },
              child: Text('Decrement',
              style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
