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
    final counter = Provider.of<Counter>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Providers Sample App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter: ${counter.getCount()}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                themeNotifier.toggleTheme();
              },
              child: Text('Toggle Theme'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DetailScreen.routeName);
              },
              child: Text('Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
