import 'package:flutter/material.dart';
import 'package:shipments/view/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
            ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MainPage(),
    );
  }
}
