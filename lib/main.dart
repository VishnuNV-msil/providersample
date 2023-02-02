import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'provider/counter_provider.dart';
import 'provider/Future_provider.dart';
import 'Screens/details_screen.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FutureNotifier(),
        )
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Providers Sample App',
            theme: themeNotifier.getTheme(),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/detail': (context) => DetailScreen(),
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (context) => HomePage());
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Providers Sample App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counter>(builder: (context, counter, child) {
              return Text(
                '${counter.Count}',
                style: Theme.of(context).textTheme.titleMedium,
              );
            }),
            ElevatedButton(
              onPressed: () {
                Provider.of<Counter>(context, listen: false).increment();
              },
              child: Text('Increment',
              style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
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
                Navigator.pushNamed(context, DetailScreen.routeName);
              },
              child: Text('Next Screen',
              style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
