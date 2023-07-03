import 'package:flutter/material.dart';
import 'package:movie_app_new/global_keys.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: MaterialApp(
        title: 'Movie App',
        navigatorKey: GlobalKeys.navigatorKey,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: HomePage(),
      ),
    );
  }
}
